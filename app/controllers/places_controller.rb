require 'flickraw-cached'

FlickRaw.api_key=ENV['FLICKR_KEY']
FlickRaw.shared_secret=ENV['FLICKR_SECRET']

class PlacesController < ApplicationController
  
  def index
    # set place
    @place = set_place
  end
  
  def show
    # find the place set in index
    @place = Place.find(params[:id])    
    
    # find the country for the country info stuff
    @country = Country.find_by(country_name: @place.country_name)
    
    # get list of photos from Flickr
    #FlickRaw.api_key=ENV['FLICKR_KEY']
    #FlickRaw.shared_secret=ENV['FLICKR_SECRET']
    # look for photos of that place and put them in a list
    #city = @place.city
    #country = @place.country_name
    #@list = flickr.photos.search :tags => "#{city} #{country}", :tag_mode => "ALL", :safe_search => '1'
    
    # make sure the API call actually did something
    #if @list["status"] == "fail"
    #  failed = true
    #end
    @list = get_photo_list(@place)

    @photo1 = GetPhotos.new(@list)
    @photo2 = GetPhotos.new(@list)
    @photo3 = GetPhotos.new(@list)
    
    # get the blurb and link from Wikipedia
    @info = QueryWikipedia.new(@place)
  end
  
  private
  
  # so that we can set a session so that the app remembers what location we're talking about even when we move from index to show
  def set_place
    places_size = Place.count - 1
    place_index = Random.new.rand(0..places_size)
    current_place = Place.find(place_index)
    session[:current_place] = current_place.id
    return current_place
  end

  def get_photo_list(place)
      city = place.city
      puts city
      country = place.country_name
      puts country
      list = flickr.photos.search :tags => "#{city} #{country}", :tag_mode => "ALL", :safe_search => '1'
      #hashed_list = list.to_hash
      photos_list = list["photo"]
      puts photos_list.length
      return { :photos_list => photos_list, :list_len => photos_list.length }
    end
  
end

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

    # initialize GetPhotos to get a list of photos for @place
    list = GetPhotos.new(@place)

    # get three photos for @place
    @photo1 = list.photo
    @photo2 = list.photo
    @photo3 = list.photo
    
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
  
end

require 'flickraw'

# Service to access the Flickr API to get photos to display on places/index
class GetPhotos
  
  # load API keys
  FlickRaw.api_key=ENV['FLICKR_KEY']
  FlickRaw.shared_secret=ENV['FLICKR_SECRET']
  
  def initialize(place)
    
    # get the Flickr ID for the city
    find_place = flickr.places.find :query => place.city
    
    # if the city doesn't exist, then check the country
    if find_place != []
      @place = find_place[0]["place_id"]
    else
      find_place = flickr.places.find :query => place.country
      @place = find_place[0]["place_id"]
    end
    
    # look for photos of that place and put them in a list
    list = flickr.photos.search :place_id => @place, :tags => "travel", :safe_search => '1' 
    
    # make sure the list actually contains something
    @list_len = list.length
    if @list_len == 0
      # put a placeholder image in there for now
      @photo = "https://www.massinsight.org/wp-content/uploads/2016/05/placeholder-4-500x300.png" 
    elsif @list_len == 1
        @photo = list[0]     
    else
      index = Random.new.rand(0..@list_len)
      @photo = list[index]
      @id = @photo.id
      @secret = @photo.secret
      @info = flickr.photos.getInfo :photo_id => @id, :secret => @secret
    end

  end
  
  def photos_list
    uploaded_by(@photo)
    profile_link(@photo)
  end
  
  def uploaded_by
    if @list_len == 0
      return "Sorry, looks like Flickr doesn't have a photo for this location!"
    else
      return "Photo by #{@info["owner"]["username"]} on Flickr"
    end
  end
  
  def profile_link
    if @list_len == 0
      return "#"
    else
      url = FlickRaw.url_profile(@info)
      return url
    end
  end
  
  def photo_url
    if @list_len == 0
      return @photo
    else
      FlickRaw.url_b(@info)
    end
  end
  
end
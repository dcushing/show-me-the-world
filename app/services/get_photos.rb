require 'flickraw'

# Service to access the Flickr API to get photos to display on places/show
class GetPhotos
  
  # load API keys
  FlickRaw.api_key=ENV['FLICKR_KEY']
  FlickRaw.shared_secret=ENV['FLICKR_SECRET']
  
  def initialize(place)
    
    # look for photos of that place and put them in a list
    city = place.city
    country = place.country
    list = flickr.photos.search :tags => "#{city} #{country}", :tag_mode => "ALL", :safe_search => '1' 
    
    # make sure the list actually contains something and if it doesn't, do some alternate things
    @list_len = list.length
    if @list_len == 1
      @photo = list[0]     
    elsif @list_len > 1
      index = Random.new.rand(0..@list_len)
      @photo = list[index]
      id = @photo.id
      secret = @photo.secret
      @info = flickr.photos.getInfo :photo_id => id, :secret => secret
    end
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
      return "https://www.flickr.com/"
    else
      url = FlickRaw.url_profile(@info)
      return url
    end
  end
  
  def photo_url
    if @list_len == 0
      return "https://www.massinsight.org/wp-content/uploads/2016/05/placeholder-4-500x300.png" 
    else
      FlickRaw.url_b(@info)
    end
  end
  
end
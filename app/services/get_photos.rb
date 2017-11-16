require 'flickraw-cached'

# Service to access the Flickr API to get photos to display on places/show
class GetPhotos
  
  # load API keys
  FlickRaw.api_key=ENV['FLICKR_KEY']
  FlickRaw.shared_secret=ENV['FLICKR_SECRET']
  
  def initialize(place)
    
    # look for photos of that place and put them in a list
    city = place.city
    country = place.country_name
    list = flickr.photos.search :tags => "#{city} #{country}", :tag_mode => "ALL", :safe_search => '1'
    
    # make sure the API call actually did something
    if list["status"] == "fail"
      @failed = true
    end
    
    # make sure the list actually contains something and if it doesn't, do some alternate things (determined in uploaded_by, profile_link, and photo_url)
    @list_len = list.length
    if @list_len == 1
      photo = list[0]   
      id = photo.id
      secret = photo.secret
      @info = flickr.photos.getInfo :photo_id => id, :secret => secret
    elsif @list_len > 1
      index = Random.new.rand(0..@list_len)
      photo = list[index]
      id = photo.id
      secret = photo.secret
      @info = flickr.photos.getInfo :photo_id => id, :secret => secret
    end
  end

  # get the username of the user who uploaded the photo so that we can give them credit
  def uploaded_by
    if @failed # if the API call fails
      return "Sorry, looks like Flickr isn't cooperating right now"
    elsif @list_len == 0 # if the search doesn't find anything for that location
      return "Sorry, looks like Flickr doesn't have a photo for this location, so have a panda instead"
    else
      return "Photo by #{@info["owner"]["username"]} on Flickr"
    end
  end
  
  # get the link to the profile of the user who uploaded the photo so that we can give them credit
  def profile_link
    if @failed ||  @list_len == 0 # send them to the flickr homepage if there are no photos of that location or if the API call fails
      return "https://www.flickr.com/"
    else
      url = FlickRaw.url_profile(@info)
      return url
    end
  end
  
  # get the URL for the photo so that we can put that on the page
  def photo_url
    if @failed
      return "penguin.jpg"
    elsif @list_len == 0 # use a picture of a panda if there are no photos for that location
      return "panda.jpg" 
    else
      FlickRaw.url_b(@info)
    end
  end
  
end
require 'flickraw'

# Service to access the Flickr API to get photos to display on places/index
class GetPhotos
  
  # load API keys
  FlickRaw.api_key=ENV['FLICKR_KEY']
  FlickRaw.shared_secret=ENV['FLICKR_SECRET']
  
  def initialize(place)
    @place = place
    list = flickr.photos.search :tags => 'travel, saigon, landscape', :tag_mode => 'all', :content_type => '1', :safe_search => '1'
    list_len = list.length
    index = Random.new.rand(0..list_len)
    @photo = list[index]
    @id = @photo.id
    @secret = @photo.secret
    @info = flickr.photos.getInfo :photo_id => @id, :secret => @secret
  end
  
  def photos_list
    uploaded_by(@photo)
    profile_link(@photo)
  end
  
  def uploaded_by
    return @info["owner"]["username"]
  end
  
  def profile_link
    url = FlickRaw.url_profile(@info)
    return url
  end
  
  def photo_url
    FlickRaw.url_b(@info)
  end

end
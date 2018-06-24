require 'flickraw-cached'

# Service to access the Flickr API to get photos to display on places/show
class GetPhotos
  
  # load API keys
  FlickRaw.api_key=ENV['FLICKR_KEY']
  FlickRaw.shared_secret=ENV['FLICKR_SECRET']

  # get a list of photos for @place from Flickr when initializing
    def initialize(place) 
    # look for photos of that place and put them in a list
    city = place[:city]
    province = place[:province]
    country = place[:country_name]

    #search by "city country travel"
    list = flickr.photos.search :tags => "#{city} #{country} travel", :tag_mode => "ALL", :safe_search => '1'

    # if that doesn't work, search by "city country"
    if list.length < 2
      list = flickr.photos.search :tags => "#{city} #{country}", :tag_mode => "ALL", :safe_search => '1'

      # if that doesn't work and province isn't nil for the place, search by "city province travel"
      if list.length < 2 and province
        list = flickr.photos.search :tags => "#{city} #{province} travel", :tag_mode => "ALL", :safe_search => '1'

        # if that doesn't work, search by "city province"
        if list.length < 2
          list = flickr.photos.search :tags => "#{city} #{province}", :tag_mode => "ALL", :safe_search => '1'

          # if that doesn't work, search by "province travel"
          if list.length < 2
            list = flickr.photos.search :tags => "#{province} travel", :tag_mode => "ALL", :safe_search => '1'

            # if that doesn't work, search by "province"
            if list.length < 2
              list = flickr.photos.search :tags => "#{province}", :tag_mode => "ALL", :safe_search => '1'

              # if that doesn't work, search by "country travel"
              if list.length < 2
                list = flickr.photos.search :tags => "#{country} travel", :tag_mode => "ALL", :safe_search => '1'

                # if that doesn't work, search by "country"
                if list.length < 2
                  list = flickr.photos.search :tags => "#{country}", :safe_search => '1'
                end
              end
            end
          end
        end

        # if "city country" doesn't work and there's no province, search by "country travel"
        elsif !province
          list = flickr.photos.search :tags => "#{country} travel", :tag_mode => "ALL", :safe_search => '1'

          # if that doesn't work, search by "country"
          if list.length < 2
            list = flickr.photos.search :tags => "#{country}", :tag_mode => "ALL", :safe_search => '1'
          end
        end
      end

      @photos_list = list["photo"]
      @list_len = @photos_list.length
  end

  # get a photo from the list and return uploaded_by, profile_link, and photo_url
  def photo
    if @list_len == 0 # no photos for that location
      return { "uploaded_by" => "Sorry, looks like Flickr doesn't have any photos for this location!", "profile_link" => "https://www.flickr.com/", "photo_url" => "https://www.flickr.com/" }
    else # only one photo for the location, so we don't need to generate a random number
      if @list_len == 1
        photo = @photos_list[0].to_hash
      else # get a random photo from the list
        random = Random.new.rand(@list_len)
        photo = @photos_list[random].to_hash
    end
      id = photo["id"]
      secret = photo["secret"]
      @info = flickr.photos.getInfo :photo_id => id, :secret => secret
      uploaded_by = "Photo by #{@info["owner"]["username"]} on Flickr"
      profile_link = FlickRaw.url_profile(@info)
      photo_url = FlickRaw.url_b(@info)
      return { "uploaded_by" => uploaded_by, "profile_link" => profile_link, "photo_url" => photo_url }
    end
  end
end
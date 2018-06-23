require 'flickraw-cached'

class GetPhotoList
	# load API keys
	FlickRaw.api_key=ENV['FLICKR_KEY']
	FlickRaw.shared_secret=ENV['FLICKR_SECRET']

	def getList(place)	    
    	# look for photos of that place and put them in a list
    	city = place[:city]
    	country = place[:country_name]
    	list = flickr.photos.search :tags => "#{city} #{country}", :tag_mode => "ALL", :safe_search => '1'

      #hashed_list = list.to_hash
      photos_list = list["photo"]
      return { :photos_list => photos_list, :list_len => photos_list.length }
    
    	# make sure the API call actually did something
    	#if @list["status"] == "fail"
      # 	failed = true
      #end
  	end
end
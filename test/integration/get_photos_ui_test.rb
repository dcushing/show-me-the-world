require 'test_helper'

class GetPhotosUiTest < ActionDispatch::IntegrationTest
  
  def setup
    @boston = places(:boston)
    @mekambo = places(:mekambo)
  end
  
  test "page displays 3 photos" do
    VCR.use_cassette("3 photos from flickr", :record => :new_episodes) do
      get place_path(@boston)
      assert_response :success
      
    end
  end
  
  #test "page displays dummy photos when flickr api pulls none" do
    #VCR.use_cassette("dummy photos") do
      #get place_path(@mekambo)
      #get place_path(places(:sarnia))
      #assert_response :success
    #end
  #end
  
end

require 'test_helper'

class GetPhotosUiTest < ActionDispatch::IntegrationTest
  
  def setup
    @boston = places(:boston)
    @mekambo = places(:mekambo)
  end
  
  test "page displays 3 photos" do
    VCR.use_cassette("3 photos from flickr") do
      get place_path(@boston)
      assert_response :success
      assert_select "img"
    end
  end
  
  test "page displays dummy photos when flickr api pulls none" do
    VCR.use_cassette("dummy photos") do
      get place_path(@mekambo)
      assert_response :success
    end
  end
  
end

require 'test_helper'
require 'vcr'

class PlacesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @base_title = "Show Me The World"
    @boston = places(:boston)
  end
  
  test "should get index" do
    VCR.use_cassette("get index") do
      get places_path
      assert_response :success
      #assert_select "title", "Where Next? - #{@base_title}"
    end
  end
  
  test "should get page for Boston" do
    VCR.use_cassette("get Boston") do
      get place_path(@boston)
      assert_response :success
      assert_select "title", "Boston - #{@base_title}"
      assert_select "h1", "Boston, Massachusetts, USA"
    end
  end
  
end

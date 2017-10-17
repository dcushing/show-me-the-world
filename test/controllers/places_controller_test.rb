require 'test_helper'
require 'vcr'

class PlacesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @base_title = "Show Me The World"
  end
  
  test "should get index" do
    VCR.use_cassette("get index") do
      get places_path
      assert_response :success
      assert_select "title", "Where Next? - #{@base_title}"
    end
  end
  
end

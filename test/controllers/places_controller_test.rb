require 'test_helper'
require 'vcr'

class PlacesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @base_title = "Show Me The World"
    @boston = places(:boston)
    @mekambo = places(:mekambo)
  end
  
  test "should get index" do
    get places_path
    assert_response :success
    assert_select "title", "Where To? - #{@base_title}"
  end
  
  test "should get page for Boston" do
    VCR.use_cassette("get Boston", :record => :once) do
      get place_path(@boston)
      assert_response :success
      assert_select "title", "Boston - #{@base_title}"
      assert_select "h1", "Boston, Massachusetts, United States of America"
    end
  end
end

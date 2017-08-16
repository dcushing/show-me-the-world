require 'test_helper'

class PlacesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @base_title = "Show Me The World"
  end
  
  test "should get index" do
    get :index
    assert_response :success
    assert_select "title", "Index - #{@base_title}"
  end
  
  test "should get show" do
    get :show
    assert_response :success
    assert_select "title", "Where Next? - #{@base_title}"
  end
end

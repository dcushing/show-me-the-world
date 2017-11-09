require 'test_helper'

class PlacesFlowTest < ActionDispatch::IntegrationTest
  
  test "go from index to a generated place" do
    VCR.use_cassette("from index to show") do
      get places_path
      assert :success
      assert_select "a", "Where to?"
    end
  end
  
end

require "application_system_test_case"

class PlacesTest < ApplicationSystemTestCase
  test "visit the index" do
    VCR.use_cassette("system test visit index") do
      visit places_url
      assert_selector "h1", "Where to next?"
    end
  end
end

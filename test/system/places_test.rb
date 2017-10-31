require "application_system_test_case"

class PlacesTest < ApplicationSystemTestCase
  test "visit the index" do
    VCR.use_cassette("system test visit index") do
      visit places_url
      click_on "Where to?"
    end
  end
end

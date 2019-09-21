require "application_system_test_case"

class PlacesTest < ApplicationSystemTestCase
  test "visit the index and visit a random place" do
    VCR.use_cassette("system test visit index", :record => :once) do
      visit places_url
      click_on "Where to?"
      assert_redirected_to(controller: "place", action: "show")
    end
  end
end

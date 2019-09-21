require 'test_helper'

class PlaceTest < ActiveSupport::TestCase
  setup do
    @boston = places(:boston)
    @mekambo = places(:mekambo)
  end

  test "valid place?" do
    assert @boston.valid?
  end

  test "invalid without city" do
    @boston.city = nil
    refute @boston.valid?
  end

  test "invalid without lat" do
    @boston.lat = nil
    refute @boston.valid?
  end

  test "invalid without lng" do
    @boston.lng = nil
    refute @boston.valid?
  end

  test "invalid without pop" do
    @boston.pop = nil
    refute @boston.valid?
  end

  test "invalid without country_name" do
    @boston.country_name = nil
    refute @boston.valid?
  end

  test "invalid without iso2" do
    @boston.iso2 = nil
    refute @boston.valid?
  end

  test "invalid without iso3" do
    @boston.iso3 = nil
    refute @boston.valid?
  end

  test "valid without province" do
    @boston.province = nil
    assert @boston.valid?
  end

end

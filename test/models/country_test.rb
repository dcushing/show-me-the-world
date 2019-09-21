require 'test_helper'

class CountryTest < ActiveSupport::TestCase
  setup do
    @us = countries(:us)
    @gabon = countries(:gabon)
    @canada = countries(:canada)
  end

  test "valid country?" do
    assert @us.valid?
    assert @gabon.valid?
  end

  test "invalid without name" do
    @us.country_name = nil
    refute @us.valid?
  end

  test "invalid without region" do
    @us.region = nil
    refute @us.valid?
  end

  test "invalid without lang" do
    @us.region = nil
    refute @us.valid?
  end

  test "invalid without currency" do
    @us.region = nil
    refute @us.valid?
  end
end

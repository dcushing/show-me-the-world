class Place < ApplicationRecord
  has_one :country
  validates :city, :lat, :lng, :pop, :country_name, :iso2, :iso3, :place_id, presence: true
end

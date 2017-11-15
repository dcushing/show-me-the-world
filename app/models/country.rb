class Country < ApplicationRecord
  #scope :place_country, -> (place_country) { where("name = ?", place_country)}
  has_many :places, through: :placenames
end

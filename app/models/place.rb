class Place < ApplicationRecord
  has_one :country #, through: :countryname
end

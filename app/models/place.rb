class Place < ApplicationRecord
  has_one :country, through: :placenames
end

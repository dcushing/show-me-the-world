class Country < ApplicationRecord
  has_many :places
  validates :country_name, :region, :lang, :currency, presence: true
end

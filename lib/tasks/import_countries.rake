require 'csv'
#require 'aws-sdk'

# Thanks to https://gorails.com/episodes/intro-to-importing-from-csv for the tutorial on how to do this!
# CSV of country data thanks to GitHub datasets (https://raw.githubusercontent.com/datasets/country-codes/master/data/country-codes.csv)

namespace :import do
  
  desc "Import countries from country-codes.csv"
  
  counter = 0 # keep count of the number of places imported to the DB
  
  task countries: :environment do
    filename = File.join Rails.root, "country-codes.csv"
    CSV.foreach(filename, headers: true) do |row|
      country = Country.create(country_name: row["official_name_en"], region: row["Sub-region Name"], lang: row["Languages"], currency: row["ISO4217-currency_name"])
        
      puts "#{name} - #{country.errors.full_messages}" if country.errors.any? # show me error messages if there's a problem
      counter += 1 if country.persisted?
    end
    
    puts "#{counter} countries imported"
  end
end
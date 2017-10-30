require 'csv'

# Thanks to https://gorails.com/episodes/intro-to-importing-from-csv for the tutorial on how to do this!
# CSV of place names thanks to http://simplemaps.com/data/world-cities

namespace :import do
  
  desc "Import places from simplemaps-worldcities-basic.csv"
  
  counter = 0 # keep count of the number of places imported to the DB
  id_num = 1
  
  task places: :environment do
    filename = File.join Rails.root, "simplemaps-worldcities-basic.csv"
    CSV.foreach(filename, headers: true) do |row|
      if row["pop"].to_i >= 100000
        place = Place.create(city: row["city"], lat: row["lat"], lng: row["lng"], pop: row["pop"], country: row["country"], iso2: row["iso2"], iso3: row["iso3"], province: row["province"], place_id: id_num)
        
        puts "#{city}, #{iso2} - #{place.errors.full_messages}" if place.errors.any? # show me error messages if there's a problem
        counter += 1 if place.persisted?
        id_num += 1 if place.persisted?
      end
    end
    
    puts "#{counter} places imported"
  end
end
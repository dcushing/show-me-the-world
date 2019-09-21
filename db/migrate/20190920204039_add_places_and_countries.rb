class AddPlacesAndCountries < ActiveRecord::Migration[5.2]
  create_table "countries", force: :cascade do |t|
    t.string "country_name"
    t.string "region"
    t.string "lang"
    t.string "currency"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "countries_places", id: false, force: :cascade do |t|
    t.integer "country_id", null: false
    t.integer "place_id", null: false
  end

  create_table "places", force: :cascade do |t|
    t.string "city"
    t.string "lat"
    t.string "lng"
    t.integer "pop"
    t.string "country_name"
    t.string "iso2"
    t.string "iso3"
    t.string "province"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "place_id"
  end
end

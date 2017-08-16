class CreatePlaces < ActiveRecord::Migration[5.1]
  def change
    create_table :places do |t|
      t.string :city
      t.string :city_ascii
      t.integer :lat
      t.integer :lng
      t.integer :pop
      t.string :country
      t.string :iso2
      t.string :iso3
      t.string :province

      t.timestamps
    end
  end
end

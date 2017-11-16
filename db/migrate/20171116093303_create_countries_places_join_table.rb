class CreateCountriesPlacesJoinTable < ActiveRecord::Migration[5.1]
  def change
    create_join_table :countries, :places do |t|
      t.index :country_name
    end
  end
end

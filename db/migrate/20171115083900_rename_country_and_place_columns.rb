class RenameCountryAndPlaceColumns < ActiveRecord::Migration[5.1]
  def change
    rename_column :places, :country, :country_name
    rename_column :countries, :name, :country_name
  end
end

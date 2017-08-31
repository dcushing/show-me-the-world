class ChangePlacesDb < ActiveRecord::Migration[5.1]
  def change
    change_column :places, :lat, :string
    change_column :places, :lng, :string
    remove_column :places, :city_ascii, :string
  end
end

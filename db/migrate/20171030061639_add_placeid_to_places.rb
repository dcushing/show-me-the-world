class AddPlaceidToPlaces < ActiveRecord::Migration[5.1]
  def change
    add_column :places, :place_id, :integer
  end
end

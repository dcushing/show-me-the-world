class AddWoeidToPlaces < ActiveRecord::Migration[5.1]
  def change
    add_column :places, :woeid, :string
  end
end

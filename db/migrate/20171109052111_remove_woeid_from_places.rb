class RemoveWoeidFromPlaces < ActiveRecord::Migration[5.1]
  def change
    remove_column :places, :woeid, :string
  end
end

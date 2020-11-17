class AddPlaceIdToShops < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :place_id, :integer
  end
end

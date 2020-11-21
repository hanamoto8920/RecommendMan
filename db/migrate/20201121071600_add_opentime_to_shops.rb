class AddOpentimeToShops < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :opentime, :string
  end
end

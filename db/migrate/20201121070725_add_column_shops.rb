class AddColumnShops < ActiveRecord::Migration[5.2]
  
  def change
    def up
      add_column :shops, :opentime, :string
      add_column :shops, :category, :string
      add_column :shops, :address, :string
    end
  end
end

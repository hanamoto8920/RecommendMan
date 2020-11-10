class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      
      t.string :name
      t.text :introduction
      t.text :url
      t.string :image_id
      t.timestamps
    end
  end
end

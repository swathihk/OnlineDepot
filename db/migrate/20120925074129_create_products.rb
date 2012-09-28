class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.string :image_url
      t.integer :user_id
      t.timestamps
    end
  end
end

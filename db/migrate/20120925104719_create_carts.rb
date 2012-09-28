class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.integer :quantity
      t.integer :product_id
      t.integer :user_id
      t.integer :total_price
      t.timestamps
    end
  end
end

class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :product_id
      t.integer :quantity
      t.integer :total_price
      t.integer :user_id
      t.integer :receipt_id
      t.integer :order_unique_id
      t.timestamps
    end
  end
end

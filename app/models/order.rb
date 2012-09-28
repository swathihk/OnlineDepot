class Order < ActiveRecord::Base
  attr_accessible :product_id, :quantity,:total_price,:user_id,:receipt_id,:order_unique_id
end

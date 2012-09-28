class Cart < ActiveRecord::Base
  attr_accessible :user_id, :product_id,:total_price,:quantity
end

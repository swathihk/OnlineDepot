class Product < ActiveRecord::Base
  attr_accessible :description, :image_url, :name, :price  ,:user_id
  validates :name ,:presence => true
  validates :description ,:presence => true
  validates :price ,:presence => true
  validates :image_url ,:presence => true
  validates :user_id ,:presence => true

  has_many :users
end

class Role < ActiveRecord::Base
   attr_accessible :role_name
   validates :role_name ,:presence =>  true
  has_many :users
end

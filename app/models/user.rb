class User < ActiveRecord::Base
   attr_accessible :name, :password,:role_id,:email
  belongs_to :role
   belongs_to :product
   validates :name ,:presence => true
   validates :password ,:presence => true
   validates :email ,:presence => true
   validates :role_id ,:presence => true
   def self.authenticate?(email, password)
     u = User.find_by_email email
     u.password == password
   end
end

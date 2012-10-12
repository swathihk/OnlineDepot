class User < ActiveRecord::Base

   attr_accessible :name, :password,:role_id,:email ,:terms_of_service,:email_confirmation,:date_of_birth,:phone_number,:company_address
   belongs_to :role
   belongs_to :product
   validates :name ,:presence => true
   validates :password ,:presence => true
   validates :email ,:presence => true  ,:confirmation => true  ,:uniqueness => true
   validates :email_confirmation, :presence => true
   validates :role_id ,:presence => true
   validates :terms_of_service, :acceptance => true  , :presence => { :message =>"Please Accept the Term and Conditions"}
   validates :phone_number ,:length => {
       :minimum   => 10,
       :maximum   => 13},:numericality => { :only_integer => true },:presence => true
   validates :company_address ,:length => {:minimum   => 30, :maximum   => 60},:presence => true
   #validate :date_of_birth_cannot_be_in_the_past
   #
   ##def date_of_birth_cannot_be_in_the_past
   #  if !date_of_birth.blank? and date_of_birth > 1994-12-31
   #    errors.add(:date_of_birth, "can't be in the above 1994")
   #  end
   #end
   def self.authenticate?(email, password)
     u = User.find_by_email email
     u.password == password
   end
has_many :orders
end

class Company < ActiveRecord::Base
   attr_accessible :name
  has_many :phone_numbers, :as => :callable, :dependent => :destroy

end

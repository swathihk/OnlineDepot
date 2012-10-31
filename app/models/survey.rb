class Survey < ActiveRecord::Base
  attr_accessible :name ,:questions_attributes ,:book_attributes
  has_many :questions, :dependent => :destroy
  has_one :book,:dependent => :destroy
  accepts_nested_attributes_for :questions , :allow_destroy => true
  accepts_nested_attributes_for :book  ,:allow_destroy => true
end

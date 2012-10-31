require 'developer'
class Gallery < ActiveRecord::Base
  include Developer
  attr_accessible :photographer_id, :name
  has_many :photos
  belongs_to :photographer

end

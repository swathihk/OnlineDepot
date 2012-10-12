class Gallery < ActiveRecord::Base
  attr_accessible :photographer_id, :name
  has_many :photos
  belongs_to :photographer

end

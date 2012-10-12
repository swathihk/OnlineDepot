class Photo < ActiveRecord::Base
   attr_accessible :gallery_id, :name,:file_path
  belongs_to :gallery

end

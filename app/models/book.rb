class Book < ActiveRecord::Base
   attr_accessible :name ,:survey_id
  belongs_to :survey
end

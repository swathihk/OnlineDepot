class Comment < ActiveRecord::Base
  attr_accessible :commenter_name, :content, :post_id
end

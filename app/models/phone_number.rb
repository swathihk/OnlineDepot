class PhoneNumber < ActiveRecord::Base
  attr_accessible :callable_id, :callable_type,:number,:location
  belongs_to :callable, :polymorphic => :true
end

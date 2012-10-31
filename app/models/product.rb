class Product < ActiveRecord::Base
  attr_accessible :description, :image_url, :name, :price  ,:user_id
  validates :name ,:presence => true
  validates :description ,:presence => true
  validates :price ,:presence => true
  validates :image_url ,:presence => true
  validates :user_id ,:presence => true

  has_many :users
  #before_save :convert_price_to_dollar
  #after_save
 after_create   :convert_dollar
 after_validation :check_image_url
  private
=begin
def convert_price_to_dollar
     self.price=self.price*54
   end
=end
  def  convert_dollar
    logger.info  ",,,,,sdsadsadsadsadasd,,,,,#{self.price}"
    @dollar_price=self.price*54
    logger.info "------#{@dollar_price}--------------"
    self.update_attributes(:price => @dollar_price)
  end
  def check_image_url
    logger.info"---------image --#{self.image_url}-----"

  end
end

require 'spec_helper'

=begin
def current_user(user)
  session[:user_id] = user.id # session is nil
                              #controller.stub!(:current_user).and_return(user) # controller is nil
end
=end

describe ProductsHelper do
  it "current"   do
  session[:user_id] = user.id
end
end




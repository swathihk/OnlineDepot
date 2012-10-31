require 'spec_helper'

describe "User" do
  describe "GET /user" do
    it "user login " do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get user_login_path
      response.status.should be(200)
    end
  end
end

require 'spec_helper'
require '/home/swathi/Training_Rails3/OnlineDepot/app/helpers/products_helper'
require 'capybara/rspec'
require 'capybara/rails'
describe "Users" do



  describe "POST /users" do

    it "User creation " do

      #User.create(:name =>"demo",:email=>"test@gmail.com",:password=>"password",:phone_number=>"1234567890",:date_of_birth=>"1990-1-21",:company_address=>"eabyas info solution near gandhi nagar ,secudabad",
      #:email_confirmation=>"test@gmail.com",:role_id=>"2",:terms_of_service=>"1")

      #expect(:get => "user/login").to route_to(:controller => "user", :action => "login")
      #get user_signup_path

      post_via_redirect user_signup_path ,:user=> {:name =>"demo",:email=>"test@gmail.com",:password=>"password",:phone_number=>"1234567890",:date_of_birth=>"1990-1-21",:company_address=>"eabyas info solution near gandhi nagar ,secudabad",
                                                   :email_confirmation=>"test@gmail.com",:role_id=>"2",:terms_of_service=>"1"}
      response.status.should be(200)
      response.body.should include("Your Are Successfully Sign in")
    end
  end
  describe "POST /user/login" do
    include    ProductsHelper
    it "user login " do

      visit user_login_path
    fill_in "Email", :with => "test@gmail.com"
    fill_in "Password",:with => "gmail"
    click_button "login"
    #login('test@gmail.com','gmail')
    #current_path.should eq products_path
      page.should have_selector('title',
                                :text => "OnlineDepot")
    #current_path == products_path
      page.should have_content("Welcome Successfully logged in!")

    #page.should have_content("Welcome Successfully logged in!")
    end
    end


#    describe "POST /users" do
#    it "User Signup " do
#      visit user_signup_path
#      fill_in "Name" ,:with => "demo"
#      fill_in "Email", :with => "test@gmail.com"
#      fill_in "Password",:with => "gmail"
#      fill_in "Phone number",:with => "23123213121"
#      #select '2011-02-05', :from => 'Date of birth'
#      #select("2011-may-3", :from => 'Date of Birth')
#      fill_in "Email confirmation" ,:with =>"test@gmail.com"
#      fill_in "Company address",:with => "eabyas info solution near gandhi nagar ,secudabad "
#      #select("buyer".to_s, :from => 'Role')
#      #select("buyer", :from => "Role")
#      check('Terms of service')
#      click_button "Signup"
#      #current_path.should == "/user/login"
#      #save_and_open_page
#    page.should have_content("Your Are Successfully Sign in")
#      #page.should have_content("swathi")
#    end
#end

    describe "login user" do
      it "should contain title"  do
            before { visit user_signup_path }
      #visit '/user/login'
      it { should have_selector('h2', :text=> 'Sign Up Form') }
      page.should have_selector('title', :text => "OnlineDepot")
      end
      end
end

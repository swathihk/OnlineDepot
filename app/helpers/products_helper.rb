module ProductsHelper
  def login(email,password)
    post user_login_path, :email => email, :password => password

  end
end

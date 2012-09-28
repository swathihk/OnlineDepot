class UserController < ApplicationController

  def create_role

    @role=Role.new(params[:role])
    if @role.save
      redirect_to :action => "index"
    end

  end
  def index

  end
  def signup

    @user=User.new(params[:user])
    if @user.save
      UserMailer.registration_confirmation(@user).deliver
      redirect_to :action => "login"
    end

  end
  def login

    if request.post?
      @user = User.new(params[:users])
    user = User.find_by_email @user.email
      if user and User.authenticate?(@user.email, @user.password)
        session[:user_id] = user.id
        flash[:notice] = "Welcome Successfully logged in!"
        redirect_to :controller => 'products'
      else
        flash[:notice] = 'Invalid username or password combination'
        render :action =>"login"
      end
   end
  end
  def logout
    session[:user_id] = nil
    flash[:notice] = 'Logged out'
    redirect_to  :controller=>'user',:action => 'login'
  end
  def cart
            @test=params[:id]
    render :js=>"$('#cart').append(#{@test});"

  end
end

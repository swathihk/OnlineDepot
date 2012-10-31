class UserController < ApplicationController
  before_filter :verify_premium_user   ,:except  => [:signup,:login ]

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
    #@userdemo=params[:email]
    #logger.info"------#{@userdemo}---------"
    if @user.save
      flash[:notice] = "Your Are Successfully Sign in"
      #UserMailer.registration_confirmation(@user).deliver
      redirect_to :action => "login"
    end

  end
  def login

    if request.post?
      @user = User.new(params[:users])
      @userdemo=params[:email]
      logger.info"------#{@userdemo}---------"
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
  def records
    @first=User.find(2)
    @second=User.first
    @third=User.last
    @fourth=User.find([2,3])
    #@fetch=User.where(:created_at=>(params[:st_date])..(params[:end_date]))
    #@wh=User.where("id = ?", params[:id])
    #@hs=User.where("id = #{params[:id]}")
    #@s=User.where("id >= :start_value AND id <= :end_value",{:start_value => params[:start_value], :end_value => params[:end_value]})

    #@userss=User.find_by! name:'Admin'
    #@u=User.where(first_name:'swathi').take!  #same
    #@take=User.take(3) #limit 2
    @first2=User.first(2)
    @last=User.last(5)
    #User.where(:id => [2,3,5])
    #User.order("created_at DESC").order("id ASC")
    #User.select("name, date_of_birth")
    User.select(:name).uniq
    User.limit(5).offset(3) #begins with 4
    @orders=Order.select("user_id,product_id, sum(total_price) as total_price").group("product_id").having("sum(total_price)>?",200)
    #@orders=Order.select("user_id,product_id, sum(total_price) as total_price").group("product_id")
    @post=Post.where('id > 10').limit(20).order('id asc').except(:order)
  end
  private
  def verify_premium_user
    user = session[:user_id]
    user = User.find(user) if user
    unless user
      redirect_to :controller => "user", :action => "signup"
    end
  end

end

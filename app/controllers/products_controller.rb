class ProductsController < ApplicationController
  # GET /products
  # GET /products.json
  def index
    @user_details=User.find(session[:user_id])
    if @user_details.role_id==2
      @products = Product.find_all_by_user_id(session[:user_id])
    else
      @products=Product.all
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @products }
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @product }
    end
  end

  # GET /products/new
  # GET /products/new.json
  def new
    @product = Product.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @product }
    end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(params[:product])
    #@user_id=session[:user_id]
    respond_to do |format|
      @product.user_id=session[:user_id]
      if @product.save
        format.html { redirect_to @product, :notice => 'Product was successfully created.' }
        format.json { render :json => @product, :status => :created, :location => @product }
      else
        format.html { render :action => "new" }
        format.json { render :json => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.json
  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to @product, :notice =>'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json =>@product.errors, :status=> :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end
  def cart

    @product_id=params[:id]
    @cart=Cart.new
    @cart.product_id=@product_id
    @cart.user_id=session[:user_id]

    #@cart_all=Cart.find_all_by_user_id(session[:user_id])

    respond_to do |format|
      @cart.save
      format.js
    end

  end
  def catalog
    @product_all_cart=Cart.find_all_by_user_id(session[:user_id])
  end
  def quantity
    @quan=params[:quantity].to_i
    @pro_price=Product.find(Cart.find(params[:cart_id]).product_id).price
    @total=@quan * @pro_price
    logger.info"------------#{@quan}--#{@pro_price}------"
    flash[:notice] = "Product was successfully created."
    render :js=>"$('#quantity#{params[:cart_id]}').html(#{@total});"
    #@cart_value=
  end
  def order
    f=Cart.find_all_by_user_id(session[:user_id])
    @last=Order.last

    f.each do |cart|
      if params["check#{cart.id}"]=="1"
        product=Product.find(cart.id)
        if @last.receipt_id.nil?
          @receipt_number="1001"
        else
          @receipt_number=@last.receipt_id.succ
        end
        @order=Order.new
        @order.product_id=cart.product_id
        @order.user_id=session[:user_id]
        @order.quantity=params["quan#{cart.id}"]
        @order.total_price=product.price.to_i * @order.quantity.to_i
        @order.order_unique_id=Time.now.to_i
        @order.receipt_id=@receipt_number
        if @order.save
        #@user=User.find(session[:user_id])
        #UserMailer.payment_mail(@user).deliver
        @cart_destroy=Cart.where(session[:user_id]).destroy_all
       end
      end
    end
  end

end

class AddProductController < ApplicationController
  

  def index
    @i = session[:user_id]
  	@b = BrandOwner.find_by_id(@i)
  	render
  end

  def adding
   @i = params[:brand_id].to_i
   @b = BrandOwner.find_by_id(@i)
  	
   @product = Product.new(param_product)
  	@b.products << @product
  	if @product.save
  		redirect_to(:action => 'view_products', :id => @b.id)
  	else
  		render('credentials/index')
    end
  end


  def view_products
   

  	@i = session[:user_id]
  	@brandsproduct = BrandOwner.find_by_id(@i)
  	render
  end

  def product_index
 
    @customer = Customer.find_by_id(session[:user_id])
    @brands = BrandOwner.all.paginate(:page => params[:page]).order("rating desc")
    render
  

  end

  def that_brand_products
    @i = params[:bid].to_i
    @b = BrandOwner.find_by_id(@i)
    render
    
  end
  
  def search_index
   @products = Product.all
  if params[:search]
    @products = Product.search(params[:search])
  else
    redirect_to(:action => "product_index")
  end
end



   def orderstatus
    @customer = Customer.find_by_id(session[:user_id])
    render
     
   end
   def order_cancelation
    @customer = Customer.find_by_id(session[:user_id])
    @customer.orders.find_by_id(params[:oid]).destroy
    render("orderstatus")
     
   end

   def order_recieved
    @customer = Customer.find_by_id(session[:user_id])
    @order = Order.find_by_id(params[:oid])
    @order.update(:recieve => false)
    render

     
   end
   def rating
    @customer = Customer.find_by_id(session[:user_id])
    @order = Order.find_by_id(params[:oid])
    @brand = BrandOwner.find_by_id(@order.brand_owner_id)
    @rating = Rating.new(param_rating)
    @brand.ratings << @rating
    if @rating.save
      @customer.orders.find_by_id(params[:oid]).destroy
      redirect_to(:action => 'calc_rating', :bid => @brand.id)
    else
      flash[:notice]="your rating was not saved"
      redirect_to(:action => 'order_recieved')
   end
 end
 def calc_rating
   @customer = Customer.find_by_id(session[:user_id]) 
   @i = params[:bid].to_i
   @brand = BrandOwner.find_by_id(@i)
   @c = @brand.ratings.count
   @s =@brand.ratings.sum(:rate)
   @r = @s/@c
   @brand.rating = @r
   if @brand.save
    render("orderstatus")
  else
    flash[:notice]="your rating was not saved"
      render('order_recieved')
  end


   
 end
  def order
  
    @i = params[:pid].to_i
    @c = params[:cid].to_i
    @product = Product.find_by_id(@i)
    @c = Customer.find_by_id(@c)
    render

  end

  def take_order
  @i = params[:prod_id].to_i
  @c = params[:customer_id].to_i
  @b = params[:brand_id].to_i
  @brand = BrandOwner.find_by_id(@b)
  @customer = Customer.find_by_id(@c)
  @product = Product.find_by_id(@i)

  @order = Order.new(param_order)

  @brand.orders << @order
  @customer.orders << @order
  @product.orders << @order
  if @order.save
      @product.increment(:order_count,  by = 1)
      @product.save
      flash[:notice]="your order is sent"
      redirect_to(:action => 'product_index')
    else
      flash[:notice]="your order could not be send"
      redirect_to(:controller => 'credentials', :action => 'index')
    end
  end


   private

  def param_product
    params.require(:product).permit(:product_name, :product_type, :product_quantity, :product_price, :image )
  end

  def param_order
    params.require(:order).permit(:order_quantity, :order_message, :status)
  end

  def param_rating
    params.require(:rating).permit(:rate)
  end
end

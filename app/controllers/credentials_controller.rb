class CredentialsController < ApplicationController
  
  def index
   @i = session[:user_id]
   @b = BrandOwner.find_by_id(@i)
    render
  end
  def signup_customer

     render
  end
  def create_customer
   
  	@customer = Customer.new(param_customer)
  	if @customer.save
      session[:user_id] = @customer[:id]
  		redirect_to(:controller => 'add_product',:action => 'product_index')
  	else
  		render('signup_customer')
    end
  end 

  def signup_brand_owner
   
   render

  end


 def search_index_for_brand
  @b = BrandOwner.find_by_id(session[:user_id])
   @products = @b.products
  if params[:search]
    @products = @b.products.search(params[:search])
  else
    redirect_to(:action => "index")
  end
end

  def create_brand_owner
    
    @brandowner = BrandOwner.new(param_brandowner)
    if @brandowner.save
      session[:user_id] = @brandowner[:id]
      redirect_to(:action => 'index')
    else
      render('credentials/signup_brand_owner')
    end

  end

  def login
    render
  end
  def verify

      if params[:verify_customer]
        @c = Customer.where(:email => params[:email]).first
        if @c.present?
          if @c[:password] != params[:password] 
            
             flash[:notice]="Email or password is wrong"
             redirect_to(:action => 'login')   
          else

          
            session[:user_id] = @c[:id]
            redirect_to(:controller => 'add_product', :action => 'product_index')
             
          end
        else
          flash[:notice]="you do not have an account as Customer"
          redirect_to(:action => 'login')
        end
        
        else 
        if params[:verify_brandowner]
          @d = BrandOwner.where(:email => params[:email]).first
          
          if @d.present?
          
            if @d[:password] != params[:password] 
             
             flash[:notice]="Email or password is wrong"
             redirect_to(:action => 'login')   
            else
            
             session[:user_id] = @d[:id]
             redirect_to(:action => 'index', :id => @d.id)
            end
          else
            flash[:notice]="you do not have an account as Brand Owner"
            redirect_to(:action => 'login')
          end
        end
      end
    
  end
  
  def logout
   session[:user_id] = nil
   redirect_to(:action => 'login') 
  end

  def accept
  @i = params[:id].to_i
  @order = Order.find_by_id(@i)
  @order.status = "accepted"
  @order.save
  redirect_to(:controller => 'credentials',:action => 'index')

  end
  def reject
  @i = params[:id].to_i
  @order = Order.find_by_id(@i)
  @order.status = "rejected"
  @order.save
  redirect_to(:controller => 'credentials',:action => 'index')

  end

  private
  def param_customer
    params.require(:customer).permit(:first_name, :last_name, :email, :password)
  end

  def param_brandowner
    params.require(:brandowner).permit(:first_name, :last_name, :email, :password, :brand_name, :shop_address, :delevery, :message)
  end
end

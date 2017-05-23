Rails.application.routes.draw do
  root 'credentials#login'

  get 'add_product/index'

  get 'add_product/view_products'

  get 'credentials/signup_costomer'

  get 'credentials/login'

  get 'credentials/signup_customer'

  get 'credentials/signup_brand_owner'

  get 'credentials/logend'

  match ':controller(/:action(/:id))', :via => [:get, :post]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  
end

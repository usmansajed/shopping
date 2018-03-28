Rails.application.routes.draw do
     devise_for :users
  	 resources :categories
     resources :products
     resources :order_items
     resources :carts
  	 root to: 'categories#index'
end

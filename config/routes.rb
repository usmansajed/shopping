Rails.application.routes.draw do
   
  devise_for :users do
  end
  resources :products
    root 'products#index'
   # root to: 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
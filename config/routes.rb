Rails.application.routes.draw do
  resources :line_items
  resources :carts
  resources :instruments do
  	resources :comments, :likes
  end
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: {
    registrations: 'registrations'
  }


  
root 'instruments#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

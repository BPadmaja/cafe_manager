Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/" => "home#index"
  resources :users
  resources :customers
  resources :owners
  resources :menu
  resources :carts
  resources :orders

  get "/signin" => "sessions#new", as: :new_sessions
  post "/signin" => "sessions#create", as: :sessions
  delete "/signout" => "sessions#destroy", as: :destroy_session
  post "/carts/add" => "carts#add"
  post "/carts/remove" => "carts#remove"
  get "orders/placed/" => "orders#placed", as: :placed_order
end

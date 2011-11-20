BrickImg::Application.routes.draw do
  get "sessions/new"
  get "users/new"
  get "users/forgot_password"
  get "users/activate"
  get "users/update_account"
  
  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  get "sign_up" => "users#new", :as => "sign_up"
  get "forgot_password" => "users#forgot_password", :as => "forgot_password"
  get "update_account" => "users#update_account", :as => "update_account"
  post "forgot_password" => "users#forgot_password", :as => "forgot_password"
  root :to => "users#new"
  resources :users
  resources :sessions
end

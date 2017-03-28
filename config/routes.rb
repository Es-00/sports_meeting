Rails.application.routes.draw do
  get 'users/signup'

  resources :sports do
    collection{post :search}
  end
  root 'sports#index'

  #User System
  get "signup" => "users#signup", :as => "signup"
  get "login" => "users#login", :as => "login"
  resources :users, only: [:create]
  post "create_login_session" => "users#create_login_session"
  delete "logout" => "users#logout", :as => "logout"

  get "interest" => "sports#interest"
  get "forenotice" => "sports#forenotice"

end

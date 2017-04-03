Rails.application.routes.draw do
  get 'users/signup'

  resources :sports do
    collection{post :search,:interesting}
  end
  resources :teams
  root 'sports#index'

  get "signup" => "users#signup", :as => "signup"
  get "login" => "users#login", :as => "login"
  resources :users, only: [:create]
  post "create_login_session" => "users#create_login_session"
  delete "logout" => "users#logout", :as => "logout"

  get "interest" => "sports#interest"
  get "forenotice" => "sports#forenotice"
  post "board" => "teams#board"
  post "update_board" => "teams#update_board", :as =>"category"
  patch "update_board" => "teams#update_board"

end

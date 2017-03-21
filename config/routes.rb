Rails.application.routes.draw do
  resources :sports

  root 'sports#index'
end

Rails.application.routes.draw do
  resources :sports do
  end
  root 'sports#index'

end

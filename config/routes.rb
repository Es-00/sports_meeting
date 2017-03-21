Rails.application.routes.draw do
  resources :sports do
    collection{post :search}
  end
  root 'sports#index'

end

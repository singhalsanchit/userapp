Rails.application.routes.draw do
  root 'home#index'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :secret_codes
  get 'users/index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :bookings, except: [:index]
  resources :users, only: [:index] do
    resources :bookings, only: [:index]
  end
  resources :locations
end

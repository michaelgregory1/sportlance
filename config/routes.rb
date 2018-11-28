Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: 'users#index'

  get 'users/new_instructor', to: 'users#new_instructor'

  resources :users do
    resources :reviews, only: [ :index, :new, :create ]
  end

  get 'availabilities/:id', to: "users#availabilities"
  resources :reviews, only: [ :show, :edit, :update, :destroy]

  resources :conversations, only: [:index, :create] do
    resources :messages, only: [:index, :new, :create]
  end

  resources :bookings, only: [:show, :create] do
    resources :payments, only: [:new, :create]
  end

  resources :bookings, except: [:index]

  resources :users, only: [:index] do
    resources :bookings, only: [:index, :clients, :new, :create]
    get 'clients', to: 'bookings#clients'
  end

  resources :locations

  resources :users, only: [:show]

  post '/toggle-availability', to: 'availabilities#toggle_availability'
  post '/redirect-to-show', to: 'bookings#redirect_to_show'

  get 'users-search', to: 'users#search_results'
  get 'no-results', to: 'users#no_results'
  post 'change-calendar-backwards', to: 'bookings#change_calendar_backwards'
  post 'change-calendar-forwards', to: 'bookings#change_calendar_forwards'
end

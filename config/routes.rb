Rails.application.routes.draw do
  devise_for :users
  root to: 'users#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users do
    resources :reviews, only: [ :index, :new, :create ]
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end
  resources :reviews, only: [ :show, :edit, :update, :destroy]

  resources :conversations, only: [:index, :create] do
    resources :messages, only: [:index, :new, :create]
  end

  resources :bookings, except: [:index]

  resources :users, only: [:index] do
    resources :bookings, only: [:index]
  end

  resources :locations

  resources :users, only: [:show]

  get 'users-search', to: 'users#search_results'
  get 'no-results', to: 'users#no_results'
end

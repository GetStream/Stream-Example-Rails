Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index]
  get 'landing/index'

  root 'landing#index'
  resources :pins
  resources :follows

  get 'me', to: 'feeds#user'
  get 'flat', to: 'feeds#flat'
  get 'aggregated', to: 'feeds#aggregated'

end

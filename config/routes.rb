Rails.application.routes.draw do
  get 'landing/index'

  root 'landing#index'
  resources :pins

end

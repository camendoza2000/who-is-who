Rails.application.routes.draw do
  resources :users
  resources :interests
  resources :welcomes
  root 'welcomes#index'
end

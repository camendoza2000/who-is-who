Rails.application.routes.draw do
  resources :users
  resources :interests
  #resources :users do
  #  resources :interests
  #end

  resources :welcomes


end

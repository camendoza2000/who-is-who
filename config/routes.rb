Rails.application.routes.draw do
  resources :users

  resources :users do
    resources :interests
  end

  resources :welcomes


end

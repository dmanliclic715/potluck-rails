Rails.application.routes.draw do
  root 'potlucks#index'
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]
  resources :potlucks
end

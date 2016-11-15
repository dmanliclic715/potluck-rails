Rails.application.routes.draw do
  devise_for :users
  root 'potlucks#index'
  resources :potlucks
end

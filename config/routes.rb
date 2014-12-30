Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users
  
  resources :articles, only: [:index, :new, :create, :show]
end

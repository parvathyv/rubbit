Rails.application.routes.draw do
  root 'articles#index'
  devise_for :users
  
<<<<<<< HEAD
  resources :articles

  namespace :admin do
  	resources :articles, :users
  end 
=======
  resources :reviews, only: [:destroy]


  resources :articles do
    resources :reviews, only: [:create, :new, :edit, :update]
  end

>>>>>>> master
end

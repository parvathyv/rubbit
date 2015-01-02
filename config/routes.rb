Rails.application.routes.draw do
  root 'articles#index'
  devise_for :users
  
  resources :reviews, only: [:destroy]


  resources :articles do
    resources :reviews, only: [:create, :new, :edit, :update]
  end

end

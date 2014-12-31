Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users


  resources :articles do
    resources :reviews
  end

end

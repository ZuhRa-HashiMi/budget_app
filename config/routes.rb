Rails.application.routes.draw do
  devise_for :users
  # devise_for :users
  # devise_for :users
  # get 'groups/index'
  # get 'groups/new'
  # get 'groups/create'
  # get 'entities/index'
  # get 'entities/new'
  # get 'entities/create'
  # get 'users/index'
  # devise_for :users
  resources :users, only: :index 
    resources :groups, only: [:index, :new, :create, :destroy] do
      resources :entities, only: [:index, :new, :create, :destroy]
    end
  root "users#index"
end

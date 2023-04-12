Rails.application.routes.draw do
  get 'shared/_message'
  get 'shared/_navbar'
  get 'splashs/index'
  devise_for :users
  root 'groups#index'
  resources :users, only: :index do
    resources :groups, only: [:index, :new, :create] do
      resources :entities, only: [:index, :new, :create]
    end
  end
end

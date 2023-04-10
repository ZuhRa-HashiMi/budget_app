Rails.application.routes.draw do
  get 'groups/index'
  get 'groups/new'
  get 'groups/create'
  get 'entities/index'
  get 'entities/new'
  get 'entities/create'
  get 'users/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

# frozen_string_literal: true

Rails.application.routes.draw do
  get 'shared/_message'
  get 'shared/_navbar'
  get 'splashs/index'
  devise_for :users
  root 'groups#index'
  resources :users, only: :index do
    resources :groups, only: %i[index new create] do
      resources :entities, only: %i[index new create]
    end
  end
end

Rails.application.routes.draw do
  resources :users, only: [:edit, :update, :index]
  resources :groups, only: [:new, :create, :edit, :update] do
    resources :messages, only: [:index, :create]
  end
  devise_for :users
  root 'groups#index'

  namespace :api do
    resources :messages, only: :index, defaults: { format: 'json' }
  end
end

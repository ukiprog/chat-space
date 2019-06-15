Rails.application.routes.draw do
  resources :users, only: [:edit, :update, :index]
  resources :groups, only: [:new, :create, :edit, :update] do
    resources :messages, only: [:index, :create]
  end
  devise_for :users
  root 'groups#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

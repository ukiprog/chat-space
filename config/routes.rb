Rails.application.routes.draw do
  get '/users/edit' => 'users#edit'
  patch '/users/update' => 'users#update'
  get '/users' => 'users#index'
  resources :groups, only: [:new, :create, :edit, :update] do
    resources :messages, only: [:index, :create]
  end
  devise_for :users
  root 'groups#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

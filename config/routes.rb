Rails.application.routes.draw do
  get '/users/edit' => 'users#edit'
  patch '/users/update' => 'users#update'
  resources :groups, only: [:new, :create, :edit, :update]
  devise_for :users
  root 'messages#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

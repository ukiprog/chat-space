Rails.application.routes.draw do
  get '/users/edit' => 'users#edit'
  post '/users/update' => 'users#update'
  devise_for :users
  root 'messages#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

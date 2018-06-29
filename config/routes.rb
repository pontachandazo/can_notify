Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users
  get '/homes' => 'homes#index'
  get '/tweets' => 'tweets#index'
  get '/tweets/new' => 'tweets#new'
  post '/tweets/create' => 'tweets#create'
  get '/tweets/:id/edit' => 'tweets#edit'
  patch '/tweets/:id' => 'tweets#update'
  delete '/tweets/:id'=> 'tweets#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end









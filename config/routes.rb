Rails.application.routes.draw do

  namespace :admin do
    resources :categories, only: [:new, :create, :destroy]
  end

  resources :categories, only: [:index, :show]
  resources :users, only: [:new, :create, :show]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/login', to: 'sessions#destroy'
end

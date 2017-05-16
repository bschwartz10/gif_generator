Rails.application.routes.draw do
  root 'users#show'
  namespace :admin do
    resources :categories, only: [:new, :create, :destroy]
  end

  resources :categories, only: [:index, :show]
  resources :users, only: [:new, :create, :show] do
    # resources :favorites, only: [:create]
  end

  resources :gifs, only:[:put] do
    put :favorite, on: :member
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/login', to: 'sessions#destroy'
end

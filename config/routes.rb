Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get '/movies', to: "movies#index"
  root "welcome#index"

  resources :directors, shallow: true do
    resources :movies, param: :slug
  end

  resources :users, only: [:new, :create, :show]

  namespace :admin do
    resources :categories, only: [:index]
    resources :awards, only: [:index, :create]
  end

  resources :carts, only: [:create]
  resources :awards, only: [:index, :show]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

end

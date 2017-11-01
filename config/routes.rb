Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "movies#index"

  resources :users, only: [:create, :new]

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'


  resources :genres, only: [:index, :show] do
    resources :movies, only: [:show]
  end

  resources :reviews, only: [:show, :create, :new] do
    resources :comments, only: [:show, :create, :new]
  end
end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "movies#index"

  resources :users, only: [:create, :new, :show]

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'


  resources :movies, only: [:show, :index]

  resources :genres, only: [:index, :show]

  resources :reviews, only: [:show, :create, :new] do
    resources :comments, only: [:show, :create, :new]
  end
end

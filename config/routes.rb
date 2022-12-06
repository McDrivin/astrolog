Rails.application.routes.draw do
  get 'nasa_picture/index'
  devise_for :users
  # root to: "pages#home"
  root 'nasa_picture#index'

  resources :events, only: %i[index show] do
    get '/page/:page', action: :index, on: :collection
  end
  resources :agencies, only: %i[index show] do
    get '/page/:page', action: :index, on: :collection
  end
  resources :astronauts, only: %i[index show] do
    get '/page/:page', action: :index, on: :collection
  end
  resources :launches, only: %i[index show] do
    get '/page/:page', action: :index, on: :collection
  end
  resources :articles, only: %i[index show]

  resources :topics, only: [:index, :show, :new, :create, :destroy] do
    resources :posts, only: [:new, :create]
    resources :topic_members, only: [:create]
  end

  resources :topic_members, only: [:destroy]

  resources :posts, only: [:show, :edit, :update, :destroy] do
    get '/page/:page', action: :index, on: :collection
    resources :messages, only: [:new, :create]
  end

  resources :messages, only: [:edit, :update, :destroy] do
    get '/page/:page', action: :index, on: :collection
  end
end

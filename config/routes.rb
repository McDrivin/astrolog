Rails.application.routes.draw do
  get 'nasa_picture/index'
  devise_for :users
  # root to: "pages#home"
  root 'nasa_picture#index'

  resources :events, only: %i[index show]
  resources :agencies, only: %i[index show]
  resources :astronauts, only: %i[index show]
  resources :launches, only: %i[index show]
  # resources :articles, only: %i[index show]

  resources :topics do
    resources :posts, only: [:new, :create]
    resources :topic_members, only: [:create]
  end
  resources :topic_members, only: [:destroy]
  resources :posts do
    resources :messages
  end
end

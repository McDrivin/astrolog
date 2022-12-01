Rails.application.routes.draw do
  get 'nasa_picture/index'
  devise_for :users
<<<<<<< HEAD
  root to: "pages#home"
=======
  # root to: "pages#home"
  root 'nasa_picture#index'
>>>>>>> master

  resources :events, only: %i[index show]
  resources :agencies, only: %i[index show]
  resources :astronauts, only: %i[index show]
  resources :launches, only: %i[index show]
<<<<<<< HEAD
  # resources :articles, only: %i[index show]
=======

  resources :topics do
    resources :posts do
      resources :messages
    end
  end
>>>>>>> master
end

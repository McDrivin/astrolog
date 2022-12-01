Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :events, only: %i[index show]
  resources :agencies, only: %i[index show]
  resources :astronauts, only: %i[index show]
  resources :launches, only: %i[index show]

  resources :topics do
    resources :posts do
      resources :messages
    end
  end
end

Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get 'launches', to: 'pages#launches'
  get 'events', to: 'pages#events'
  get 'agencies', to: 'pages#agencies'
  get 'astronauts', to: 'pages#astronauts'
end

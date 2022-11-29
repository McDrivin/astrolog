Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  # resouces :events, only: [:index, :show]
end

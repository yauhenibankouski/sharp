Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  # Exercises
  resources :exercises
end

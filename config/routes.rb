Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  
  # Trainings
  resources :trainings
  # Exercises
  resources :exercises
end

Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  # Exercises
  resources :exercises

  # SharedTrainingPlans
  resources :bookings do
    resources :shared_training_plans, except: [:new]
  end
end

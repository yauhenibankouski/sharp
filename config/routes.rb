Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  # Trainings
  resources :trainings
  # Exercises
  resources :exercises


  # SharedTrainingPlans
  resources :bookings do
    resources :shared_training_plans, except: [:new]
  end

  # Bookings/clients - see all clients
  get "/bookings/clients", to: "bookings#clients", as: "clients"

end

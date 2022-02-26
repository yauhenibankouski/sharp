Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  # Trainings
  resources :trainings
  # Exercises
  resources :exercises

  # Bookings/clients - see all clients
  get "/bookings/clients", to: "bookings#clients", as: "clients"
end

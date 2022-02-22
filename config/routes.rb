Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # Exercises
  resources :exercises

  # Bookings/clients - see all clients
  get "/bookings/clients", to: "bookings#clients", as: "clients"
end

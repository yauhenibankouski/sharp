Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :training_plans
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  # Trainings
  resources :trainings
  # Exercises
  resources :exercises

  # SharedTrainingPlans
  resources :bookings do
    resources :shared_training_plans, except: [:new] do
      #collection does not take an id and overrides default member method
      collection do
        resources :shared_exercises, only: [:show]
      end
    end
  end

  # Bookings/clients - see all clients
  get "/bookings/clients", to: "bookings#clients", as: "clients"

end

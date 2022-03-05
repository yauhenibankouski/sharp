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
    collection do
      get "/clients", to: "bookings#clients", as: "clients"
      get "/trainers", to: "bookings#trainers", as: "trainers"
    end

    resources :shared_training_plans, except: [:new] do
      #collection does not take an id and overrides default member method
        resources :shared_exercises, only: [:show, :destroy] do
          resources :messages, only: :create
          resources :history_logs, only: [:new, :create, :index, :delete]
        end
    end
  end
end
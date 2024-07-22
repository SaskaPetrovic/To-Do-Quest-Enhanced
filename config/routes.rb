Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get "up" => "rails/health#show", as: :rails_health_check

  get '/dashboard', to: 'dashboard#index'

  resources :tasks do
    member do
      get :accept, to: 'tasks#accept', as: :accept
      patch :accept
      patch :update_steps
    end
  end



  resources :achievements, only: [:index, :create]

  resources :users, only: [:update]
end

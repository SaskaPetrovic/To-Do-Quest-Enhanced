Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get "up" => "rails/health#show", as: :rails_health_check

  get '/dashboard', to: 'dashboard#index'

  resources :tasks do
    patch :accept, on: :member
  end

  resources :achievements, only: [:index, :create]

  patch '/users/:id', to: 'users#update'
  put '/users/:id', to: 'users#update'

  resources :users do
    member do
      patch 'update'
      put 'update'
    end
  end
end

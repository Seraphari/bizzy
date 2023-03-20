Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :founders, except: [:destroy]
  resources :investors, only: [:index, :show, :edit, :update]
  resources :sectors, only: [:index, :show]
end

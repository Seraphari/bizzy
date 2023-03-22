Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  post 'founders/:id/follow', to: 'founders#follow', as: 'follow'
  post 'founders/:id/unfollow', to: 'founders#follow', as: 'unfollow'
  post 'founders/:id/accept', to: 'founders#accept', as: 'accept'
  post 'founders/:id/decline', to: 'founders#decline', as: 'decline'
  post 'founders/:id/cancel', to: 'founders#cancel', as: 'cancel'
  # Defines the root path route ("/")
  # root "articles#index"
  resources :founders, except: [:destroy]
  resources :investors, only: [:index, :show, :edit, :update]
  resources :sectors, only: [:index, :show]
end

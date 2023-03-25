Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :founders, except: [:destroy]

  post 'founders/:id/follow', to: 'founders#follow', as: 'follow'
  post 'founders/:id/unfollow', to: 'founders#unfollow', as: 'unfollow'
  post 'founders/:id/accept', to: 'founders#accept', as: 'accept'
  post 'founders/:id/decline', to: 'founders#decline', as: 'decline'
  post 'founders/:id/cancel', to: 'founders#cancel', as: 'cancel'
  # Defines the root path route ("/")
  # root "articles#index"
  resources :investors, only: [:index, :show, :edit, :update]
  resources :sectors, only: [:index, :show]
  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end

  resources :investors, only: :index do
    member do
      post 'favorite', to: "investors#toggle_favorite"
    end
  end

  resources :founders, only: :index do
    member do
      post 'favorite', to: "founders#toggle_favorite"
    end
  end
end

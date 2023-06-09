Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  root to: "investors#index"
  get '/home', to: 'pages#home'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :founders, except: [:destroy]

  get 'founders/:id/follow', to: 'founders#follow', as: 'follow'
  get 'founders/:id/unfollow', to: 'founders#unfollow', as: 'unfollow'
  post 'founders/:id/accept', to: 'founders#accept', as: 'accept'
  post 'founders/:id/decline', to: 'founders#decline', as: 'decline'
  get 'founders/:id/cancel', to: 'founders#cancel', as: 'cancel'
  # Defines the root path route ("/")
  # root "articles#index"
  resources :sectors, only: [:index, :show]

  resources :chatrooms, only: [:index, :show] do
    resources :messages, only: :create
  end

  get 'investors/all', to: 'investors#all', as: 'all'

  resources :investors do
    resource :chatrooms, only: :show
  end


  resources :investors do
    member do
      post 'favorite', to: "investors#toggle_favorite"
    end
  end
end

Rails.application.routes.draw do
  namespace :admin do
    resources :authentications
resources :comments
resources :conversations
resources :favourites
resources :images
resources :listings
resources :messages
resources :users

    root to: "authentications#index"
  end

  root 'listings#index'

  resources :users do
    collection do
      match 'search'=> 'users#search', via: [:get, :post], as: :search
    end
    member do
      post 'favourite'
      delete 'unfavourite'
    end
    resources :comments
    resources :favourites, only: [:index]
  end


  resources :listings do
    collection do
      match 'search' => 'listings#search', via: [:get, :post], as: :search
    end
    member do
      post 'favourite'
      delete 'unfavourite'
    end
    resources :comments
  end

  resources :user_sessions, only: [:new, :create, :destroy]
  resources :password_resets

  get 'login' => 'user_sessions#new', as: :login
  post 'logout' => 'user_sessions#destroy', as: :logout

  post "oauth/callback" => "oauths#callback"
  get "oauth/callback" => "oauths#callback" # for use with Github, Facebook
  get "oauth/:provider" => "oauths#oauth", :as => :auth_at_provider


  resources :conversations do
    resources :messages
  end

  resources :tags, only: [:index, :show]
end

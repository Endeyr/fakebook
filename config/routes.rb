# frozen_string_literal: true

Rails.application.routes.draw do
  devise_scope :user do
    # Redirests signing out users back to sign-in
    get 'users', to: 'devise/sessions#new'
    match '/sessions/user', to: 'devise/sessions#create', via: :post
  end
  put '/users/:id', to: 'users#update_img'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  get 'static_pages/home'
  get    '/help',   to: 'static_pages#help'
  get    '/about',  to: 'static_pages#about'
  get    '/contact', to: 'static_pages#contact'
  root 'static_pages#index'
  # get '*path' => redirect('/')
  resources :posts, only: %i[index new create show destroy] do
    resources :likes, only: %i[create]
  end
  resources :comments, only: %i[new create destroy] do
    resources :likes, only: %i[create]
  end
  resources :users, only: %i[index show] do
    resources :friendships, only: %i[create] do
      collection do
        get 'accept_friend'
        get 'decline_friend'
      end
    end
  end
end

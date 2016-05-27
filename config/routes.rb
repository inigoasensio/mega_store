OnlineStore::Application.routes.draw do
  # Devise authenticated routes
  devise_for :users, path_names: { sign_in: 'login', sign_out: 'logout' },
    controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  # Devise Login
  # as :user do
  #   get 'login' => 'devise/registrations#new', :as => 'new_user_registration'
  # end

  # Devise Scopes
  devise_scope :user do

    # Authenticated root
    authenticated :user do
      root :to => 'products#index', as: :authenticated_root
    end

    # Unauthenticated root
    unauthenticated :user do
      root :to => 'devise/sessions#new', as: :unauthenticated_root
    end

    # Omniauth sign_out
    # delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  end

  authenticate :user do
    resources :users, only: [:show, :edit] do
      get 'shipping_detail', to: 'users#shipping_detail', as: :shipping_detail
      resources :addresses
    end
  end

    resources :products, :order_items

    resources :transactions, only: [:new, :create]
    resources :purchases, only: [:show]
    resource :cart, only: [:show]

  namespace :admin do
    resources :users
    # resources :addresses
    resources :categories
    # resources :credit_cards
    resources :orders
    resources :order_items
    resources :products
    resources :purchases
    # resources :shippers
    # resources :suppliers

    root to: "users#index"
  end

end

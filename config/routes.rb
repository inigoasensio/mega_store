OnlineStore::Application.routes.draw do
  # root
  root :to => 'products#index'

  # Devise authenticated routes
  devise_for :users, path_names: { sign_in: 'login', sign_out: 'logout' }

  as :user do
    get 'login' => 'devise/registrations#new', :as => 'new_user_registration'
  end

  devise_scope :user do
    authenticated :user do
      root :to => 'products#index', as: :authenticated_root
    end
    unauthenticated :user do
      root :to => 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  authenticate :user do
    resources :products, :payments, :orders
  end
end

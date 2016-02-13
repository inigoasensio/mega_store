OnlineStore::Application.routes.draw do
  root :to => 'products#index'

  # Devise views
  devise_for :users, path_names: { sign_in: 'login', sign_out: 'logout' }

  resources :products, :orders, :payments

  get "carts/show"

  resource :cart, only: [:show] do
    #put 'add/:product_id', to: 'carts#add', as: :add_to
    put 'remove/:product_id', to: 'carts#remove', as: :remove_from
  end
end

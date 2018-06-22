Rails.application.routes.draw do

  
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "sessions", only: [:create]

  resources :users, controller: "users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  get "/sign_in" => "sessions#new", as: "sign_in"
  delete "/sign_out" => "sessions#destroy", as: "sign_out"
  get "/sign_up" => "users#new", as: "sign_up"
  root "properties#index"

  get "/auth/:provider/callback" => "sessions#create_from_omniauth"

  resources :properties do
    resources :bookings
  end

  resources :bookings

  resources :bookings do
    resources :properties
  end
  # end

  post "properties/:id/verify" => "properties#verify", as: "verify_property"

  resources :users

  resources :braintree

  get "/bookings/:id/braintree/new" => "braintree#new", as: "new_payment"

  post "/bookings/:id/braintree/checkout" => "braintree#checkout", as: "braintree_checkout"

  # get "/users/:id/edit" => "users#edit", as: "my_account"

  # post "users/:id/update" => "users#update", as: "update_account"
  # get "properties/#{:id}/verify" => "properties#verify", as: "verify_property"

  # get "properties/:id/bookings/new" => "bookings#new", as: "new_booking(:id)"

  # resources :users do
  #   resources :properties do
  #     resources :bookings
  #   end

end

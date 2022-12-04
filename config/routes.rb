Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }
  
  resources :users, only: [:index, :show, :update, :create, :delete]
  resources :user_contacts, only: [:index, :show, :new, :edit, :save, :update, :create, :delete], :path => "contacts"
  resources :appointments, only: [:index, :show, :new, :edit, :save, :update, :create, :delete]

  # resources :sessions, only: [:destroy]

  root "home#index"  
end

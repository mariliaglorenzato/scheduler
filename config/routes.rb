Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }
  
  resources :users, only: [:index, :show, :update, :create, :delete]
  resources :user_contacts, only: [:index, :show, :new, :edit, :save, :update, :create, :delete, :destroy], :path => "contacts"
  resources :appointments, only: [:index, :show, :new, :edit, :save, :update, :create, :delete]
  resources :appointment_guests, only: [:create, :destroy]
  resources :user_contact_groups, only: [:index], :path => "groups"
  # resources :sessions, only: [:destroy]

  root "home#index"  
end

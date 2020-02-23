Rails.application.routes.draw do
  devise_for :users
  root "sites#index"

  resources :invoices, only: [:new, :create, :index]
end

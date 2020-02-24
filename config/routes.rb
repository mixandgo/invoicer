Rails.application.routes.draw do
  devise_for :users
  root "invoices#index"

  resources :invoices, only: [:new, :create, :index]
end

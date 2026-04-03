Rails.application.routes.draw do
  resources :companies
  resources :users
  resources :transactions
  resources :entities
  resources :sellers
  resources :buyers
  resources :cdds
  resources :vois
  resources :pep_statuses
  resources :kycs
  resources :kybs
  resources :risk_assessments
  resources :documents
  resources :ubos
  resources :shareholders
  resources :directors
  resources :trust_roles

  get "up" => "rails/health#show", as: :rails_health_check
end

Rails.application.routes.draw do
  resources :party_relationships
  resources :party_roles
  resources :party_relationship_types
  resources :role_types
  resources :parties
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  post "/graphql", to: "graphql#execute"
  resources :payments
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

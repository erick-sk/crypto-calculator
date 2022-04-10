Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
  root to: "projections#new"
  
  get 'projections/:id', to: "projections#show", as: "projection"
  post 'projections', to: "projections#create", as: "projections"

  # resources :projections, only: [:new, :show]
end

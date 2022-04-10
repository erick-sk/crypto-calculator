Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
  root to: "projections#new"
  
  post 'projections', to: "projections#create", as: "projections"
  get 'projections/:id', to: "projections#show", as: "projection"
  get 'projections/:id/export', to: "projections#export", as: "projection_export_csv"
end

India::Engine.routes.draw do
  root "dashboard#index"
  
  resources :projects do
    resources :team_members, only: [:index, :show]
    resources :documents, only: [:index, :show]
  end
  
  resources :team_members, only: [:index, :show]
  resources :documents, only: [:index, :show]
  resources :locations, only: [:index, :show]
  
  get "about_india", to: "about#index"
  get "localization", to: "localization#index"
  get "partnerships", to: "partnerships#index"
end 
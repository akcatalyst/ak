Space::Engine.routes.draw do
  root "missions#index"
  
  resources :missions do
    resources :crew_members, only: [:index, :show]
    resources :equipment, only: [:index, :show]
  end
  
  resources :crew_members, only: [:index, :show]
  resources :equipment, only: [:index, :show]
  resources :locations, only: [:index, :show]
  
  get "dashboard", to: "dashboard#index"
  get "analytics", to: "analytics#index"
end 
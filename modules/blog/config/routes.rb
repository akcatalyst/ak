Blog::Engine.routes.draw do
  root "posts#index"
  
  resources :posts do
    resources :comments, only: [:create, :destroy]
  end
  
  resources :categories, only: [:index, :show]
  resources :tags, only: [:index, :show]
  
  get "search", to: "search#index"
end 
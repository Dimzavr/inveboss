Rails.application.routes.draw do
  resources :posts 
  resources :tags, only: [:show]
  resources :categories
  root "posts#index"
end

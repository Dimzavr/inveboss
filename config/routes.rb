Rails.application.routes.draw do
  resources :posts 
  resources :tags, only: [:show]
  root "posts#index"
end

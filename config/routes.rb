Rails.application.routes.draw do
  resources :events
  resources :wish_items
  resources :posts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#home"
  get "crew", to: "pages#crew"
end

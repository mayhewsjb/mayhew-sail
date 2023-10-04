Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  resources :events do
    collection do
      get :admin_index
    end
  end
  resources :wish_items do
    collection do
      get :admin_index
    end
  end
  resources :posts do
    collection do
      get :admin_index
    end
  end  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#home"
  get "crew", to: "pages#crew"
end

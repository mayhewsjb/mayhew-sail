Rails.application.routes.draw do
  get 'contact_forms/new'
  get 'contact_forms/create'
  get 'contact_forms/admin_index'
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
  end
  resources :contact_forms, only: [:new, :create, :update] do
    collection do
      get :admin_index
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  root "pages#home"
  get "crew", to: "pages#crew"
end

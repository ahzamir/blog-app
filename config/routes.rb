Rails.application.routes.draw do
  devise_for :users
  root 'users#index'
  resources :users, only: [:index, :show] do
    resources :posts do
      resources :comments
      resources :likes
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # API routes
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users do
        resources :posts do
          resources :comments
          resources :likes
        end
      end
    end
  end

  # API route for authentication
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :authentications, only: :create
    end
  end
end

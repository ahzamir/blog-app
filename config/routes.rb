Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show]
  end

  get '/posts/new', to: 'posts#new', as: 'new_post'
  post '/posts', to: 'posts#create'
  get '/comments/new', to: 'comments#new', as: 'new_comment'
  post '/comments/new', to: 'comments#create'
  post '/likes/new', to: 'likes#create'
  # Defines the root path route ("/")
  # root "articles#index"
end

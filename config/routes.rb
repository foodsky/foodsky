Rails.application.routes.draw do

  get 'bookmarks/index'
  get 'bookmarks/create'

  get 'bookmarks/destroy'

  get 'comments/create'

  get 'comments/destroy'

  root 'page#landing'

  get 'photos/destroy'
  get 'page/home', as: 'home'

  devise_for :users

  resources :recipes
  resources :users, only: [:show]
  resources :photos
  resources :recipes do
    resources :comments, only: [:create, :destroy]
    resources :bookmarks, only: [ :create, :destroy ]
    resources :likes, only: [ :create, :destroy ]
  end

  resources :users, only: [:show] do
    member do
      get :following, :followers
    end
  end

  #resources :relationships, only: [:create, :destroy]

  post '/relation/:following_id', to: 'relationships#build', as: :build_fellowship
  delete '/relation/:following_id', to: 'relationships#over', as: :over_fellowship
end

Rails.application.routes.draw do

  get 'users/show'

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
  end
end

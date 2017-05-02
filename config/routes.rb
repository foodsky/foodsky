Rails.application.routes.draw do

  root 'page#home'

  get 'photos/destroy'

  devise_for :users

  resources :recipes
  resources :photos
end

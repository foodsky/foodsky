Rails.application.routes.draw do

  root 'page#landing'

  get 'photos/destroy'
  get 'page/home', as: 'home'

  devise_for :users

  resources :recipes
  resources :photos
end

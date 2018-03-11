Rails.application.routes.draw do
  resources :dishes, only: [:create]

  root 'foodstocks#index'

  resources :users, only: [:new, :create, :show, :update, :edit]
  resources :sessions, only: [:new, :create, :destroy]

  resources :foodstocks
  resources :recipes

  resources :favorites, only: [:create, :destroy]
  resources :ingredients, only: [:new, :create, :update, :edit, :destroy]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  
end

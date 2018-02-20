Rails.application.routes.draw do
  root 'foodstoks#index'

  resources :users, only: [:new, :create, :show, :update, :edit]
  resources :sessions, only: [:new, :create, :destroy]

  resources :recipes
  resources :foodstocks

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  
end

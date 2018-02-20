Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show, :update, :edit]
  resources :recipes
  resources :foodstocks

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  
end

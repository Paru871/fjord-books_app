Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  devise_for :users
  root to: 'books#index'
  resources :books
  resources :users, only: %i(index show)
  # resources :users do
    # member do
    #   get :followings, :followers
    # end
    resources :users do
      resources :followings, only: %i[index], module: :users
      resources :followers, only: %i[index], module: :users
    end
  # end
  resources :relationships, only: [:create, :destroy]
end

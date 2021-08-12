Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  # devise_for :users
  root to: "books#index"
  resources :books
  devise_for :users, controllers: {
    registrations: 'devise/registrations',
    sessions: 'users/sessions'
  }
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  resources :users, :only => [:index, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

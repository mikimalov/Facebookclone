Rails.application.routes.draw do
  root to: 'articles#index'

  resources :users

  resources :articles do
    resources :likes
  end

  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end

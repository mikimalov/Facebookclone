Rails.application.routes.draw do
  root to: 'users#new'

  resources :users, only: [:create, :show, :destroy]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

end

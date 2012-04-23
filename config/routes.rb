AkiinyoBlog::Application.routes.draw do
  root to: 'portal#index'

  match '/signup', to: 'users#new'
  match '/signin', to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete

  resources :posts
  resources :users
  resources :sessions, only:[:new, :create, :destroy]
end

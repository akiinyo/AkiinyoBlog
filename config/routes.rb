AkiinyoBlog::Application.routes.draw do
  root to: 'portal#index'

  match '/signup', to: 'users#new'
  match '/signin', to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete

  resources :users do
    resources :posts, controller: 'users/posts' do
      resources :comments, controller: 'users/posts/comments'
    end
  end
  resources :sessions, only:[:new, :create, :destroy]
end

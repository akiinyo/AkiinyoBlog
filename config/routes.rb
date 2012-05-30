AkiinyoBlog::Application.routes.draw do
  root to: 'portal#index'
  match '/portal/information', to: 'portal#information'

  match '/signup', to: 'users#new'
  match '/signin', to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete

  match '/auth/:provider/callback' => 'sessions#create'

  resources :users, only: [:new, :create] do
    resources :posts, controller: 'users/posts' do
      resources :comments, controller: 'users/posts/comments'
    end
  end

  resource :my, controller: :my, only: [:show] do
    resources :posts, controller: 'my/posts'
    resources :comments, controller: 'my/comments', only: [:index]
    resource :profile, controller: 'my/profiles'
    resources :buttons, controller: 'my/buttons' do
      resources :puts, controller: 'my/buttons/puts', only: [:create]
    end
  end
  resources :sessions, only:[:new, :create, :destroy]
end

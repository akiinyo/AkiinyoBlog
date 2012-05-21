AkiinyoBlog::Application.routes.draw do
  root to: 'portal#index'
  match '/portal/information', to: 'portal#information'

  match '/signup', to: 'users#new'
  match '/signin', to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete

  match '/auth/:provider/callback' => 'sessions#create'

  resources :users, only: [:new, :create, :show] do
    resources :posts, controller: 'users/posts' do
      resources :comments, controller: 'users/posts/comments'
    end
    resource :profile, controller: 'users/profiles'
    resources :buttons, controller: 'users/buttons' do
      resources :puts, controller: 'users/buttons/puts', only: [:create]
    end
  end
  resources :sessions, only:[:new, :create, :destroy]
end

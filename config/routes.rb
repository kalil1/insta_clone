Rails.application.routes.draw do
  get 'comments/create'
  get 'comments/delete'
  resources :asses
  post "comment", to: 'comments#create'
  get "post/comments", to: 'comments#post_comments'
  post "post/comments", to: 'comments#post_comments'
  post "uncomment", to: 'comments#delete'
  post "like", to: 'unions#like'
  post "follow", to: 'unions#follow'
  post "unlike", to: 'unions#unlike'
  post "unfollow", to: 'unions#unfollow'
  resources :profiles
  resources :posts
  get 'my_feed', to: 'home#index'
  root 'home#index'
  resources :users do
    collection do
      get 'recommended'
      get 'search'
    end
  end
  resources :unions
end

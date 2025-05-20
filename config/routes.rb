Rails.application.routes.draw do
  get 'comments/create'
  get 'comments/delete'
  resources :asses
  post "comment", to: 'comments#create'
  post '/generate_presigned_url', to: 'uploads#generate_presigned_url'
  get "explore_page", to: 'posts#explore_page'
  get "post/comments", to: 'comments#post_comments'
  post "post/comments", to: 'comments#post_comments'
  post "uncomment", to: 'comments#delete'
  post "like", to: 'unions#like'
  get 'profiles/search', to: 'profiles#search'
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

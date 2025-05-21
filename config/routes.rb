Rails.application.routes.draw do
  # post "comment", to: 'comments#create'
  # get "explore_page", to: 'posts#explore_page'
  # get "post/comments", to: 'comments#post_comments'
  # post "post/comments", to: 'comments#post_comments'
  # post "uncomment", to: 'comments#delete'       Not sure what I was doing here but this projest is 6 years old
  mount ActionCable.server => '/cable'
  resources :comments
  post '/generate_presigned_url', to: 'uploads#generate_presigned_url'
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

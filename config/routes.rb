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
  get 'home/index'
  root 'home#index'
  Rails.application.routes.draw do
  get 'comments/create'
  get 'comments/delete'
  resources :unions
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

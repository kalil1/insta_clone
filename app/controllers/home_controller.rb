class HomeController < ApplicationController
  def index
    render json: Post.limit(15).order('RANDOM()').to_json(methods: :likes, 
    include: [profile: { only: :name }, 
    comments: { include: { profile: { only: :name } } , only: :body }])
  end
end

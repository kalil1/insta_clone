class HomeController < ApplicationController
  def index
    posts = Post.includes(:profile, comments: :profile)
                .order('RANDOM()')
                .limit(15)

    render json: posts, each_serializer: PostSerializer
  end
end

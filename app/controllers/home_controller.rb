class HomeController < ApplicationController
  def index
    posts = Post.limit(15).order('RANDOM()')

    render json: posts, methods: :likes, include: {
      profile: { only: :name },
      comments: {
        include: { profile: { only: :name } },
        only: :body
      }
    }
  end
end

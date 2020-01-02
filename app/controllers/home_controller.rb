class HomeController < ApplicationController
  def index
    @posts = Post.all.last 12
  end
end

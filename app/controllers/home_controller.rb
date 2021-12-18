class HomeController < ApplicationController
  def index
    render :json => Post.all.includes(:comments, :user)
  end
end

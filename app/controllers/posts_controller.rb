class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]
  # Will make more complex later when user auth is a thing in this project

  def index
    posts = Post.includes(:profile, comments: :profile).order(created_at: :desc).limit(15)
    render json: posts, each_serializer: PostSerializer
  end

  def show
    render json: @post, serializer: PostSerializer
  end

  def explore_page
    posts = Post.includes(:profile, comments: :profile).order(created_at: :desc).limit(30)
    render json: posts, each_serializer: PostSerializer
  end

  def create
    post = Post.new(post_params)
    post.profile = current_user.profile

    if post.save
      render json: post, serializer: PostSerializer, status: :created
    else
      render json: { errors: post.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @post.update(post_params)
      render json: @post, serializer: PostSerializer, status: :ok
    else
      render json: { errors: @post.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    head :no_content
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:caption, :post_img)
  end
end

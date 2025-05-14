class CommentsController < ApplicationController
  before_action :set_post, only: [:create, :post_comments]

  def create
    comment = @post.comments.new(
      profile: current_user.profile,
      body: params[:body]
    )

    if comment.save
      render json: comment, status: :created
    else
      render json: { errors: comment.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    if comment.profile == current_user.profile
      comment.destroy
      head :no_content
    else
      render json: { error: "Unauthorized" }, status: :unauthorized
    end
  end

  def post_comments
    comments = @post.comments.includes(:profile)
    render json: comments, each_serializer: CommentSerializer
  end

  private

  def set_post
    @post = Post.find(params[:post_id] || params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Post not found" }, status: :not_found
  end
end

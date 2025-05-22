class CommentsController < ApplicationController
  before_action :set_post, only: [:create, :post_comments]

  def create
    comment = @post.comments.new(comment_params)

    if comment.save
      serialized = CommentSerializer.new(comment).serializable_hash
      CommentChannel.broadcast_to(comment.post, serialized)
      render json: serialized, status: :created
      # render json: comment, status: :created
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
    @post = Post.find(params[:post_id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Post not found" }, status: :not_found
  end

  def comment_params
    params.require(:comment).permit(:body, :profile_id, :post_id)
  end
end

class CommentsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    comment = post.comments.new
    comment.profile = current_user.profile
    comment.post = post
    comment.body = params[:body]
    respond_to do |format|
      if comment.save
        format.js { render :js => "comment(#{post.id});" }
      end
    end
  end

  def delete
  end

  def post_comments
    @post = Post.find(params[:id])
  end
end

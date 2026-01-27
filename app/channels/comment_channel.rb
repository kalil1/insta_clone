class CommentChannel < ApplicationCable::Channel
  def subscribed
    stream_for Post.find(params[:post_id])
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end

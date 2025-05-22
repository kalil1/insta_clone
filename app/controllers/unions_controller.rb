class UnionsController < ApplicationController
  before_action :set_union, only: [:show, :update, :destroy]

  def index
    @unions = Union.all
    render json: @unions
  end

  def like
    existing_union = Union.find_by(user1: union_params[:user1], postid: union_params[:postid], union_type: "like")
    if existing_union
      render json: { message: "Already liked" }, status: :ok
    else
      union = Union.new(union_params)
      if union.save
        render json: union, status: :created
      else
        render json: union.errors, status: :unprocessable_entity
      end
    end
  end

  def unlike
    union = Union.find_by(
      user1: params[:union][:user1],
      postid: params[:union][:postid],
      union_type: "like"
    )
  
    if union
      union.destroy
      render json: { message: "Unliked" }, status: :ok
    else
      render json: { error: "Union not found" }, status: :not_found
    end
  end

  def unfollow
    @union = Union.where(user1: params[:user1], user2: params[:user2], union_type: 'follow').first
    if @union
      @union.destroy
      render json: { message: 'Follow removed' }, status: :ok
    else
      render json: { error: 'Follow not found' }, status: :not_found
    end
  end

  def follow
    @union = Union.new(union_params)
    if @union.save
      render json: @union, status: :created
    else
      render json: { error: 'Unable to create follow' }, status: :unprocessable_entity
    end
  end

  private

  def set_union
    @union = Union.find_by(id: params[:id])
    render json: { error: 'Union not found' }, status: :not_found if @union.nil?
  end

  def union_params
    params.require(:union).permit(:user1, :user2, :postid, :union_type)
  end
end

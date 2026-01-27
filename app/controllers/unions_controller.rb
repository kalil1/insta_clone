class UnionsController < ApplicationController
  before_action :set_union, only: [:show, :update, :destroy]

  def index
    @unions = Union.all
    render json: @unions
  end

  def unlike
    @union = Union.where(user1: params[:user1], postid: params[:postid], union_type: 'like').first
    if @union
      @union.destroy
      render json: { message: 'Union removed' }, status: :ok
    else
      render json: { error: 'Union not found' }, status: :not_found
    end
  end

  def like
    @union = Union.new(union_params)
    if @union.save
      render json: @union, status: :created
    else
      render json: { error: 'Unable to create union' }, status: :unprocessable_entity
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
    params.permit(:user1, :user2, :union_type)
  end
end

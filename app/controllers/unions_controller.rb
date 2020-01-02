class UnionsController < ApplicationController
  before_action :set_union, only: [:show, :edit, :update, :destroy]

  def index
    @unions = Union.all
  end

  def unlike
    @union = Union.where(:user1 => params['user1'], :postid => params['postid'], union_type: "like")[0]
    @union.destroy if !@union.nil?
    # respond_to do |format|
    #   format.js { render :js => "my_function();" }
    # end
  end

  def like
    @union = Union.new
    @union.user1 = params['user1']
    @union.user2 = params['user2']
    @union.postid = params['postid']
    @union.save
    # respond_to do |format|
    #   format.js { render :js => "my_function();" }
    # end
  end

  def unfollow
    @union = Union.where(:user1 => params['user1'], :user2 => params['user2'], union_type: "follow")[0]
    @union.destroy if !@union.nil?
  end

  def follow
    @union = Union.new
    @union.user1 = params['user1']
    @union.user2 = params['user2']
    @union.union_type = params['type']
    @union.save
  end

  private
    def union_params
      params.permit(:user1, :user2, :union_type)
    end
end

class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :update, :destroy]

  def index
    @profiles = Profile.all
    render json: @profiles
  end

  def show
    @posts = Post.where(profile_id: @profile.id).order(created_at: :desc)
    render json: { profile: @profile, posts: @posts }
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user
    
    if @profile.save
      render json: @profile, status: :created, location: @profile
    else
      render json: @profile.errors, status: :unprocessable_entity
    end
  end

  def search
    if params[:query].present?
      search_term = params[:query].downcase
      matching_profiles = Profile.where('LOWER(name) LIKE ?', "%#{search_term}%").limit(5)
      render json: { profiles: matching_profiles }, status: :ok
    else
      render json: { error: 'Query parameter is required' }, status: :bad_request
    end
  end

  def update
    if @profile.update(profile_params.merge(profile_pic: profile_params[:profile_pic]))
      render json: @profile, status: :ok
    else
      render json: @profile.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @profile.destroy
    head :no_content
  end

  private

  def set_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:name, :website, :bio, :phone, :profile_pic)
  end
end

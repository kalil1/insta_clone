class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :update, :destroy]

  # GET /profiles
  def index
    @profiles = Profile.all
    render json: @profiles
  end

  # GET /profiles/1
  def show
    @posts = Post.where(profile_id: @profile.id).order(created_at: :desc)
    render json: { profile: @profile, posts: @posts }
  end

  # POST /profiles
  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user
    
    if @profile.save
      render json: @profile, status: :created, location: @profile
    else
      render json: @profile.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /profiles/1
  def update
    if @profile.update(profile_params.merge(profile_pic: profile_params[:profile_pic]))
      render json: @profile, status: :ok
    else
      render json: @profile.errors, status: :unprocessable_entity
    end
  end

  # DELETE /profiles/1
  def destroy
    @profile.destroy
    head :no_content
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_profile
    @profile = Profile.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def profile_params
    params.require(:profile).permit(:name, :website, :bio, :phone, :profile_pic)
  end
end

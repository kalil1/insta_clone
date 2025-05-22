class UsersController < ApplicationController
    # before_action :authenticate_user!, only: [:update, :recommended]
  
    def index
      users = User.all
      render json: users, each_serializer: UserSerializer
    end
  
    def show
      user = User.find(params[:id])
      render json: user, serializer: UserSerializer
    end
  
    def update
      user = current_user # Use current_user instead of finding by ID
      if user.update(user_params)
        render json: user, serializer: UserSerializer
      else
        render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def search
      users = User.where('username LIKE ?', "%#{params[:query]}%")
      render json: users, each_serializer: UserSerializer
    end
  
    def recommended
      users = User.limit(5).order('RANDOM()') # Example logic for recommendations
      render json: users, each_serializer: UserSerializer
    end
  
    private
  
    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end
  end
  
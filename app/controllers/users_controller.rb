class UsersController < ApplicationController
    skip_before_action :authorize, only: :create
  
    def show
      user = User.find_by(id: session[:user_id])
      if user 
        render json: user
      else
        render json: { error: "Unauthorized" }, status: :unauthorized
      end
    end

    def create 
        user=User.create!(user_params)
        session[:user_id]= user.id
        render json:user, status: :created
    end

    private
    def user_params
      params.permit(:username, :password, :password_confirmation)
    end
  end
# app/controllers/users_controller.rb
class UsersController < ApplicationController
    # GET /users
    def index
      users = User.all
      render json: users
    end
  
    # POST /users
    def create
      user = User.new(user_params)
      if user.save
        render json: { message: 'User created', user: user }, status: :created
      else
        render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    private
  
    def user_params
      params.require(:user).permit(:name, :email)
    end
  end
  
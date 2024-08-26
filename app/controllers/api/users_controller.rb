module Api
  class UsersController < ApplicationController
    skip_before_action :authenticate_request

    def create
      user = User.create!(user_params)
      render json: user, status: :created
    rescue ActiveRecord::RecordInvalid => e
      Rollbar.error(e)
      render json: e&.record&.errors&.messages, status: :unprocessable_entity
    end

    def is_email_available
      email = params[:email]
      if User.exists?(email: email)
        render json: { message: 'Email is not available.', error: true }, status: 404
      else
        render json: { message: 'Email is available.', error: false }, status: 200
      end
    end
  
    private
  
    def user_params
      params.require(:user).permit(:name, :email, :phone, :password, :password_confirmation)
    end
  end
end

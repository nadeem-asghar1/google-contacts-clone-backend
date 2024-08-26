module Api
  class AuthenticationController < ApplicationController
    skip_before_action :authenticate_request

    def authenticate
      email = params[:session][:email]
      password = params[:session][:password]
      auth_token = UserAuthentication.new(email, password).call

      if !auth_token.nil?
        render json: { auth_token: auth_token }
      else
        render json: nil, status: :unauthorized
      end
    end
  end
end

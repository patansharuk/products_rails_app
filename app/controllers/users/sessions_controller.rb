# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  respond_to :json

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  def respond_with(resource, *args)
    if resource.persisted?
      render json: {resource: resource, token: request.env['warden-jwt_auth.token'], message: 'Logged in successfully.'}, status: :ok
    else
      render json: {message: 'Invalid Email or password.', errors: resource.errors}, status: :unauthorized
    end
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  def respond_to_on_destroy
    if request.headers['Authorization'].present?
      begin
        jwt_payload = JWT.decode(request.headers['Authorization'].split(' ').last, Rails.application.credentials.devise_jwt_secret_key!).first
        current_user = User.find(jwt_payload['sub'])
      rescue
        render json: {message: 'Invalid or Expired token!'}, status: :no_content
      end
    else
      if current_user
        render json: {
          message: 'Logged out successfully.'
        }, status: :no_content
      else
        render json: {
          message: "Couldn't find an active session."
        }, status: :unauthorized
      end
    end
  end
end

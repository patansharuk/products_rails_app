class ApplicationController < ActionController::Base
    protect_from_forgery with: :null_session

    private

    def authenticate_user!
        if user_signed_in?
            super
        else
            render json: {message: 'Unauthorised'}, status: 401
        end
    end
end

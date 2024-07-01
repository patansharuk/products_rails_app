class ApplicationController < ActionController::Base
    protect_from_forgery with: :null_session

    rescue_from CanCan::AccessDenied do |exception|
        respond_to do |format|
          format.json { render json: {message: 'Item not found'}, status: :not_found }
        end
    end

    def admin_dashboard
        begin
            @analytics = {
                products_count: Product.count,
                stores_count: Store.count,
                dealers_count: User.where(role: 'dealer').count,
                customers_count: User.where(role: 'customer').count
            }
            render json: {data: @analytics, message: 'Fetched analytics succesfully'}, status: :ok
        rescue => e
            render json: {message: e}, status: :unprocessable_entity
        end
    end

    private

    def authenticate_user!
        if user_signed_in?
            super
        else
            render json: {message: 'Unauthorised'}, status: 401
        end
    end
end

class StoresController < ApplicationController
    before_action :authenticate_user!
    load_and_authorize_resource
    before_action :set_store, except: [:index, :create, :store_products, :store_analytics]

    def index
        @stores = Store.accessible_by(current_ability)
        render json: {data: @stores, message: 'Stores fetched successfully' }, status: :ok
    end

    def create
        @store = User.find_by(id: current_user.id).create_dealer_detail(dealer_detail_params)
        if @store.nil?
            render json: { message: 'User not found. May have technical problem!' }
        end

        if @store.save()
            render json: { message: 'Dealer details created successfully', id: @store.id }, status: :created
        else
            render json: { message: @store.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def show
        render json: {message: 'Item fetched successfully', data: @store}, status: :ok
    end

    def update
        if @store.update(dealer_params)
            render json: {message: 'Item updated!', data: @store}, status: :ok
        else
            render json: {message: @store.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def destroy
        if @store.destroy
            render json: {message: 'Item deleted successfully.'}, status: :ok
        else
            render json: {message: @store.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def store_products
        @storeProducts = Store.find_by(id: params[:id]).products
        render json: {data: @storeProducts, message: 'Successfully fetched store products' }
    end

    def store_analytics
        begin
            @stores_count = Store.count - 1
            @products = Store.find_by(user_id: current_user.id).products.count
            @analytics = {
                competitors: @stores_count,
                total_dealer_products: @products
            }
            render json: {message: 'Products fetched successfully!', data: @analytics}, status: :ok
        rescue => e
            render json: {message: e}, status: :not_found
        end
    end

    private

    def dealer_detail_params
        params.require(:dealer_detail).permit(:name, :location, :rating)
    end

    def set_store
        @store = Store.find_by(id: params['id'])
        if @store.nil?
            render json:{message: 'Store with id not found!'}, status: :not_found
        end
        @store
    end
end
class StoresController < ApplicationController
    before_action :authenticate_user!
    before_action :set_dealer, except: [:index, :create, :store_products]

    def index
        @stores = Store.all
        render json: {data: @stores, message: 'Stores fetched successfully' }, status: :ok
    end

    def create
        if current_user.role != 'dealer'
            render json: { message: 'You should be dealer to create the product'}
        else
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

    private

    def dealer_detail_params
        params.require(:dealer_detail).permit(:name, :location, :rating)
    end

    def set_dealer
        @store = Store.find_by(id: params['id'])
        if @store.nil?
            render json:{message: 'Store with id not found!'}, status: :unprocessable_entity
        end
        @store
    end
end
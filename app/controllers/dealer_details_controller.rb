class DealerDetailsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_dealer, except: [:index, :create, :dealer_products]

    def index
        @dealers = DealerDetail.all
        render json: {data: @dealers, message: 'Dealer Details fetched successfully' }, status: :ok
    end

    def create
        if current_user.role != 'dealer'
            render json: { message: 'You should be dealer to create the product'}
        else
            @dealerDetail = User.find_by(id: current_user.id).create_dealer_detail(dealer_detail_params)
            if @dealerDetail.nil?
                render json: { message: 'User not found. May have technical problem!' }
            end

            if @dealerDetail.save()
                render json: { message: 'Dealer details created successfully', id: @dealerDetail.id }, status: :created
            else
                render json: { message: @dealerDetail.errors.full_messages }, status: :unprocessable_entity
            end
        end
    end

    def show
        render json: {message: 'Item fetched successfully', data: @dealerDetail}, status: :ok
    end

    def update
        if @dealerDetail.update(dealer_params)
            render json: {message: 'Item updated!', data: @dealerDetail}, status: :ok
        else
            render json: {message: @dealerDetail.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def destroy
        if @dealerDetail.destroy
            render json: {message: 'Item deleted successfully.'}, status: :ok
        else
            render json: {message: @dealerDetail.errors.full_messages}, status: :unprocessable_entity
        end
    end


    def dealer_products
        @dealerProducts = DealerDetail.find_by(id: params[:id]).products
        render json: {data: @dealerProducts, message: 'Successfully fetched dealer products' }
    end

    private

    def dealer_detail_params
        params.require(:dealer_detail).permit(:name, :location, :rating)
    end

    def set_dealer
        @dealerDetail = DealerDetail.find_by(id: params['id'])
        if @dealerDetail.nil?
            render json:{message: 'DealerDetails with id not found!'}, status: :unprocessable_entity
        end
        @dealerDetail
    end
end
class DealerDetailsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_dealer, except: [:index, :create]

    def index
        @dealers = DealerDetail.all
        render json: {data: @dealers, message: 'Dealer Details fetched successfully' }, status: :ok
    end

    def create
        @dealerDetail = DealerDetail.new(dealer_params)
        if @dealerDetail.save()
            render json: { message: 'Dealer details created successfully', id: @dealerDetail.id }, status: :created
        else
            render json: { errors: @dealerDetail.errors.full_messages }, status: :unprocessable_entity
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

    private

    def dealer_params
        params.require(:dealer).permit(:name)
    end

    def set_dealer
        @dealerDetail = DealerDetail.find_by(id: params['id'])
        if @dealerDetail.nil?
            render json:{message: 'DealerDetails with id not found!'}, status: :unprocessable_entity
        end
        @dealerDetail
    end
end
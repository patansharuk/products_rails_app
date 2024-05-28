class DealerDetailsController < ApplicationController
    before_action :authenticate_user!

    def index
        @dealers = DealerDetail.all
        render json: @dealers, status: :ok
    end

    def show
        @dealer = DealerDetail.find_by(id: params['id'])
        if !@dealer.nil?
            render json: @dealer, status: :ok
        else
            render json: {message: 'Dealer not found'}, staus: :ok
        end
    end
end
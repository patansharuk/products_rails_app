class ReviewsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_product
    before_action :set_review, except: [:index, :create]

    def index
        @reviews = @product.reviews
        render json: @reviews
    end

    def create
        if @product.reviews.create(review_params)
            render json: @product.reviews
        else
            render json: {message: 'failed creating review!'}
        end
    end

    def update
        if @review.update(review_params)
            render json: @review
        else
            render json: {message: 'failed creating review!'}
        end
    end

    def destroy
        if @review.destroy
            render json: {message: 'review deleted successfully!'}
        else
            render json: {message: 'review deletion failed!'}
        end
    end

    private

    def review_params
        params[:review].permit(:description)
    end

    def set_product
        @product = Product.find_by(id: params[:product_id])
        if !@product
            render json: {message: 'product with id not found..!'}
        end
    end

    def set_review
        @review = @product.reviews.find_by(id: params[:id])
        if !@review
            render json: {message: 'review with id not found..!'}
        end
    end
end

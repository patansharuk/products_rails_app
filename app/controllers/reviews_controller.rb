class ReviewsController < ApplicationController
    protect_from_forgery with: :null_session

    def index
        @product = Product.find_by(id: params[:product_id])
        if @product
            @reviews = @product.reviews
            render json: @reviews
        else
            render json: {message: 'product with id not found!'}
        end
    end

    def create
        @product = Product.find_by(id: params[:product_id])
        if @product
            if @product.reviews.create(review_params)
                render json: @product.reviews
            else
                render json: {message: 'failed creating review!'}
            end
        else
            render json: {message: 'product with id not found!'}
        end
    end

    def update
        @product = Product.find_by(id: params[:product_id])
        if @product
            @review = @product.reviews.find_by(id: params[:id])
            if @review
                if @review.update(review_params)
                    render json: @review
                else
                    render json: {message: 'failed creating review!'}
                end
            else
                render json: {message: 'review with id not found!'}
            end
        else
            render json: {message: 'product with id not found!'}
        end
    end

    def destroy
        @product = Product.find_by(id: params[:product_id])
        if @product
            @review = @product.reviews.find_by(id: params[:id])
            if @review
                if @review.destroy
                    render json: {message: 'review deleted successfully!'}
                else
                    render json: {message: 'review deletion failed!'}
                end
            else
                render json: {message: 'review with id not found!'}
            end
        else
            render json: {message: 'product with id not found!'}
        end
    end

    private

    def review_params
        params[:review].permit(:description)
    end
end

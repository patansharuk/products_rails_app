class ProductsController < ApplicationController
    protect_from_forgery with: :null_session

    def index
        @products = Product.all
        render json: @products
    end

    def create
        @product = Product.new(product_params)
        if @product.save
            render json: @product
        else
            render json: {message: 'Failed creating product!'}
        end
    end

    def update
        @product = Product.find_by(id: params[:id])
        if @product
            if @product.update(product_params)
                render json: @product
            else
                render json: {message: @product.errors.full_messages}
            end
        else
            render json: {message: 'product with id not found'}
        end
        
    end

    def destroy
        @product = Product.find_by(id: params[:id])
        if @product
            if @product.destroy
                render json: @product
            else
                render json: {message: @product.errors.full_messages}
            end
        else
            render json: { message: 'Product with id not found' }
        end
    end

    private

    def product_params
        params[:product].permit(:title, :description)
    end
end

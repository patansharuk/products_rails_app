class ProductsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_product, except: [:index, :create]

    def index
        @products = Product.all
        render json: @products, status: :ok
    end

    def create
        @product = Product.new(product_params)
        if @product.save
            render json: @product, status: :created
        else
            render json: {message: 'Failed creating product!'}, status: :unprocessable_entity
        end
    end

    def update
        if @product.update(product_params)
            render json: @product, status: :ok
        else
            render json: {message: @product.errors.full_messages}
        end       
    end

    def destroy
        if @product.destroy
            render json: @product, status: :ok
        else
            render json: {message: @product.errors.full_messages}
        end
    end

    private

    def product_params
        params[:product].permit(:title, :description)
    end

    def set_product
        @product = Product.find_by(id: params[:id])
        if !@product
            render json: { message: 'Product with id not found.!'}
        end
    end
end

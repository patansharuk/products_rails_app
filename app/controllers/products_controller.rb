class ProductsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_product, except: [:index, :create]
    before_action :set_dealer, only: [:create]

    def index
        LoggingJob.perform_async()
        @products = Product.all
        render json: {data: @products, message: 'Products fetched successfully!'}, status: :ok
    end

    def create
        @product = @store.products.create(product_params)
        if @product.save
            render json: {data: @product, message: 'Product created successfully.'}, status: :created
        else
            render json: {message: @product.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def update
        if @product.update(product_params)
            render json: {data: @product, message: 'Product updated successfully!'}, status: :ok
        else
            render json: {message: @product.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def destroy
        if @product.destroy
            render json: {data: @product, message: 'Product deleted successfully!'}, status: :no_content
        else
            render json: {message: @product.errors.full_messages}, status: :unprocessable_entity
        end
    end

    private

    def product_params
        params[:product].permit(:title, :description, :price, :image_url)
    end

    def set_product
        @product = Product.find_by(id: params[:id])
        if !@product
            render json: { message: 'Product with id not found.!'}, status: :unprocessable_entity
        end
    end

    def set_dealer
        @store = Store.find_by(id: params[:store_id])
        if !@store
            render json: { message: 'Store with id not found!' }, status: :unprocessable_entity
        end
    end
end

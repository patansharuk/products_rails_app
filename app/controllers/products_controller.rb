class ProductsController < ApplicationController
    def index
        @products = Product.all
        respond_to do |format|
            # format.html
            # format.xml { render xml: @products }
            format.json { render json: @products }
        end
    end
end

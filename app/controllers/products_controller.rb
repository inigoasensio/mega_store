class ProductsController < ApplicationController
  respond_to :html, :json

  # GET products
  def index
    @products = Product.all
    respond_with(@products)
  end

  # GET product
  def show
    @product = Product.find(params[:id])
    respond_with(@product)
  end

  # DELETE products
  def destroy
    @product = Product.find(params[:id])
    @product.update_attribute(voided_at: Date.current)
  end
end

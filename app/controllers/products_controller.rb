class ProductsController < ApplicationController
  respond_to :html, :json

  # GET products
  def index
    @products = Product.all
    respond_with(@products)
  end

  def new
    @product = Product.new(params)
  end

  # POST create
  def create
    @product = Product.new(params)
    @product.save
  end

  # GET product
  def show
    find_product
    respond_with(@product)
  end

  # PUT
  def update

  end

  # DELETE products
  def destroy
    find_product
    @product.update_attribute(voided_at: Date.current)
  end

  private

  def find_product
    @product = Product.find(params[:id])
  end
end

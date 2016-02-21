class ProductsController < ApplicationController
  respond_to :html, :json

  # GET products
  def index
    @products = Product.all
    @order_item = current_order.order_items.new
  end

  # POST create
  def create
    @product = Product.new(params[:product])
    @product.save
  end

  # GET product
  def show
    find_product
    @order_item = current_order.order_items.new
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

class ProductsController < ApplicationController
  respond_to :html, :json

  # GET products
  def index
    @products = Product.all
    @order_detail = OrderDetail.new
    current_order.order_detail = @order_detail
  end

  # POST create
  def create
    @product = Product.new(params[:product])
    @product.save
  end

  # GET product
  def show
    find_product
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

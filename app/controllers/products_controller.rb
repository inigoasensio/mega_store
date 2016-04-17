class ProductsController < ApplicationController
  respond_to :html, :json

  # GET products
  def index
    if params[:category].nil?
      @products = Product.all
    else
      @products = Product.where(category_id: params[:category])
    end
    @order_item = current_order.order_items.new
    @categories = Category.includes(:subcategories).where(:parent_id => nil)
  end

  # POST product
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

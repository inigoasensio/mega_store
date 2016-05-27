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

  def new
    @product = Product.new
  end

  # POST product
  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "Product created successfully"
    else
      flash[:alert] = @product.errors.full_messages
    end
    render :new
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

  def product_params
    params.require(:product).permit(:name, :description, :sku, :barcode, :weight, :price, :image, :category_id)
  end

  def find_product
    @product = Product.find(params[:id])
  end
end

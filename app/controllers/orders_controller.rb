class OrdersController < ApplicationController
  respond_to :html, :json

  # GET
  def index
    binding.pry
    @orders = Order.all
  end

  # POST create
  def create
    @product = Product.find(params[:order_item][:product_id])
    @order = current_order
    #@order_items = @order.order_items.new(params[:order_items])
    @order.save
    session[:order_id] = @order.id
  end

  # GET
  def show
    find_order
  end

  # PUT
  def update

  end

  # DELETE
  def destroy
    find_order
    @order.update_attribute(voided_at: Date.current)
  end

  private

  def find_order
    @order = Order.find(params[:id])
  end
end

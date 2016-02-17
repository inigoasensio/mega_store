class OrdersController < ApplicationController
  respond_to :html, :json

  # GET
  def index
    @orders = Order.all
    @order_items = current_order.order_items
  end

  # POST create
  def create
    @order = current_order
    @order_items = @order.order_items.new(product_id: params[:order][:product_id])
    if @order.save
      flash[:success]
      redirect_to orders_path
    else
      @order.errors
    end
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

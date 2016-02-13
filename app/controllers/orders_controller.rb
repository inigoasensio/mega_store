class OrdersController < ApplicationController
  respond_to :html, :json
  helper_method :current_order

  # GET
  def index
    @orders = Order.all
  end

  # POST create
  def create
    @order = current_order
    @order_detail = OrderDetail.new(params[:order_detail])
    @order.order_detail = @order_detail
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

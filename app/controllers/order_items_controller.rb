class OrderItemsController < ApplicationController
  respond_to :html, :js, :json

  # GET
  def index
    @order_items = OrderItem.all
    #@order_items = current_order.order_items
  end

  # POST create
  def create
    @order = current_order
    @order_items = @order.order_items.build(params[:order_item])
    if @order.save
#      session[:order_id] = @order.id
#      msg = @order.order_items.length
      flash[:success] = "Success Message"
    else
      flash[:alert] = @order.errors.full_messages
    end
    #info = { msg: msg, qty: qty }
    #render json: :
  end

  # PUT
  def update
    find_order_item
    @order_item.update_attributes
    @order_items = @order.order_items
  end

  # DELETE
  def destroy
    find_order_item
    @order_item.destroy
  end

  private

  def find_order_item
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
  end
end

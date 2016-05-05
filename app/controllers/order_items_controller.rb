class OrderItemsController < ApplicationController
  respond_to :html, :js, :json

  # GET
  def index
    @order_items = current_order.order_items
  end

  # POST
  def create
    @order = current_order
    @order_item = @order.order_items.build(params[:order_item])
    if @order.save
      @order.add_to_cart
      session[:order_id] = @order.id
      # flash[:notice] = "Success"
    else
      flash[:alert] = @order.errors.full_messages
    end
    render json: { cart_count: @order.cart_count, msg: flash[:notice] = "Success" }
  end

  # PUT
  def update
    find_order_item
    @order_item.update_attributes
    @order_items = @order.order_items
  end

  # DELETE
  def destroy
    find_order_item.destroy
    render json: { cart_count: @order.cart_count, cart_total: @order.cart_total }
    flash[:success] = "Item deleted"
  end

  private

  def find_order_item
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
  end
end

class OrderItemsController < ApplicationController
  respond_to :html, :js, :json

  # GET
  def index
    @order_items = current_order.order_items
  end

  # POST
  def create
    @order = current_order
    @order_item = @order.order_items.build(order_item_params)
    if @order.save
      @order.add_to_cart
      session[:order_id] = @order.id
      # flash[:notice] = "Success"
      render json: { cart_count: @order.cart_count, msg: flash[:notice] = "Added to Cart" }
    else
      render json: { msg: flash[:alert] = @order_item.errors.full_messages }
    end
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

  def order_item_params
    params.require(:order_item).permit(:currency, :unit_price, :quantity, :size, :status, :total_price, :product_id)
  end

  def find_order_item
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
  end
end

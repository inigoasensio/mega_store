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
    @order_items = @order.order_items.build(product_id: params[:order_item][:product_id])
    if @order.save
      session[:order_id] = @order.id
      flash[:success]
    else
      redirect_to root
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
    find_order_item
    @order_item.update_attribute(voided_at: Date.current)
  end

  private

  def find_order_item
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    #@order_item = OrderItem.find(params[:id])
  end
end

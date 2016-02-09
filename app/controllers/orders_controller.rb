class OrdersController < ApplicationController
  respond_to :html, :json

  # GET
  def index
    @orders = order.all
    respond_with(@orders)
  end

  def new
    @order = order.new(params)
  end

  # POST create
  def create
    @order = order.new(params)
    @order.save
  end

  # GET
  def show
    find_order
    respond_with(@order)
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
      @order = order.find(params[:id])
    end
end

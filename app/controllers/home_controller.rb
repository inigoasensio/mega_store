class HomeController < ApplicationController

  def index
    @categories = Category.includes(:subcategories).where(:parent_id => nil)
    @products = Product.where(:category_id => params[:category_id])
    @order_item = current_order.order_items.new
  end

end

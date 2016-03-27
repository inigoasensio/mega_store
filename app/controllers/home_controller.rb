class HomeController < ApplicationController

  def index
    @category = nil
    @categories = Category.find(:all, :conditions => {:category_id => nil } )
    @products = Product.all
    @order_item = current_order.order_items.new
  end

  def show
    @category = Category.find(params[:id])
    @categories = @category.subcategories
    render :action => :index
  end

end

class CategoriesController < ApplicationController

  def index
    @categories = Category.includes(:subcategories).where(:parent_id => nil)
  end

  def show
    @category = Category.find(params[:id])
    @categories = @category.subcategories
  end

end

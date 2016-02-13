class CartsController < ApplicationController
  respond_to :html
  before_filter :authenticate_user!

  def show
    @cart_products = current_user.get_cart_products
  end

  def add
  end

  def remove
  end

  private

  def current_user_cart
    current_user.id
  end
end

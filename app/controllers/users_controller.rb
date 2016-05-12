class UsersController < ApplicationController
  def show
  end

  def edit
  end

  def shipping_detail
    # @shipping_order = current_user.orders.where(status: 'purchased')
    @product = OrderItem.find_by_status('purchased').product
  end
end

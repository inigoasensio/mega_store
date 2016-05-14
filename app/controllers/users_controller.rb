class UsersController < ApplicationController
  def show
  end

  def edit
  end

  def shipping_detail
    # Purchase.find_by_status('purchased')
    @shipping_order = current_user.orders.find_by_status('purchased')
    @product = OrderItem.find_by_status('purchased').product
  end

  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end

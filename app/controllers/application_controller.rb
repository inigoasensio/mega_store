class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
  helper_method :current_order

  def current_order
    if user_signed_in?
      if session[:order_id].nil?
        orders = Order.new
        current_user.orders.build
      else
        current_user.orders.find(session[:order_id])
      end
    end
  end

end

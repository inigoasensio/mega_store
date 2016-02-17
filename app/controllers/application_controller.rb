class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_order

  def current_order
    if session[:order_id].nil?
      current_user.orders.build
    else
      current_user.orders.find(session[:order_id])
    end
  end

end

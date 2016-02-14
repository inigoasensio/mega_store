class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_order

  def current_order
    if session[:order_id].nil?
      Order.new(user_id: current_user.try(:id))
    else
      Order.find(session[:order_id])
    end
  end

end

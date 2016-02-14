class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_order
    if session[:order_id].nil?
      Order.new
    else
      Order.find(session[:order_id])
    end
  end

end

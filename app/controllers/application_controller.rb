class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
  helper_method :current_order

  def current_order
    if user_signed_in?
      # return unless session[:order_id]
      # @current_order ||= session[:current_order_id] && Order.find_by(id: session[:current_order_id])
      if session[:order_id].nil?
        order = Order.new
        order.user = current_user
        order
      else
        Order.find(session[:order_id])
      end
    end
  end

end

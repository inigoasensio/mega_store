class TransactionsController < ApplicationController
  respond_to :html, :json
  before_action :authenticate_user!
  before_action :check_cart!

  def new
  end

  private

  def check_cart!
    if current_user.get_cart_products.blank?
      redirect_to root_url, alert: "Please add some items"
    end
  end
end

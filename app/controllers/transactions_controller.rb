class TransactionsController < ApplicationController
  respond_to :html, :json
  #before_action :authenticate_user!
  #before_action :check_cart!

  def new
    generate_client_token
  end

  def create
    @result = Braintree::Transaction.sale(
      amount: current_user.cart_total_price,
      payment_method_nonce: params[:payment_method_nonce])
  end

  private

  def generate_client_token
    Braintree::ClientToken.generate
  end

  def check_cart!
    if current_user.get_cart_products.blank?
      redirect_to root_url, alert: "Please add some items"
    end
  end
end

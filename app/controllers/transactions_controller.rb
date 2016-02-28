class TransactionsController < ApplicationController
  respond_to :html, :js, :json
  #before_action :authenticate_user!
  #before_action :check_cart!

  def new
    @client_token = generate_client_token
  end

  def create
    @result = Braintree::Transaction.sale(
      amount: current_order.cart_total,
      payment_method_nonce: params[:payment_method_nonce])
      if @result.success?
        redirect_to authenticated_root_path
      else
        flash[:alert] = @result.errors
        generate_client_token
        render :new
      end
  end

  private

  def generate_client_token
    if current_user.has_payment_info?
      Braintree::ClientToken.generate(customer_id: current_user.braintree_customer_id)
    else
      Braintree::ClientToken.generate
    end
  end

  def check_cart!
    if current_order.order_items.blank?
      redirect_to cart_path, alert: "Please add some items"
    end
  end
end

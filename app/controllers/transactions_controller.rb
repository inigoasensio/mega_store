class TransactionsController < ApplicationController
  respond_to :html, :js, :json
  before_filter :authenticate_user!
  before_filter :check_cart!

  def new
    @client_token = generate_client_token
  end

  def create
    unless current_user.has_payment_info?
      binding.pry
      @result = Braintree::Transaction.sale(
        amount: current_order.cart_total,
        payment_method_nonce: params[:payment_method_nonce],
        customer: {
          first_name: params[:first_name],
          last_name: params[:last_name],
          email: current_user.email
        },
        shipping: Address.find_or_create_by(current_user.address),
        options: {
          store_in_vault_on_success: true
        }
      )
    else
      @result = Braintree::Transaction.sale(
        amount: current_order.cart_total,
        shipping: current_user.has_shipping_address?,
        payment_method_nonce: params[:payment_method_nonce])
    end

    @purchase = Purchase.new(
      user_id: current_user.id,
      order_id: current_order.id
    )

    if @result.success?
      current_user.update_attributes(braintree_customer_id: @result.transaction.customer_details.id) unless current_user.has_payment_info?
      @purchase.save
      current_order.success
      redirect_to user_shipping_detail_path(current_user), flash: { notice: "Transaction Successful" }
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

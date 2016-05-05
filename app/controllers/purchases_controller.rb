class PurchasesController < ApplicationController
  before_filter :set_purchase, only: [ :show ]

  def show
    respond_to do |format|
      format.pdf {
        binding.pry
        send_data @purchase.receipt.render,
                  filename: "#{@purchase.created_at.strftime("%Y-%m-%d")}-receipt.pdf",
                  type: "application/pdf",
                  disposition: :inline
      }
    end
  end

  private

  def set_purchase
    @purchase = current_user.purchases.find(params[:id])
  end

end

class ProductsController < ApplicationController
  respond_to :html, :json

  # GET products
  def index
    @products = Product.all
    respond_with(@products)
  end

  # DELETE products
  def destroy
    self.update_attributes(voided_at: Date.current)
  end
end

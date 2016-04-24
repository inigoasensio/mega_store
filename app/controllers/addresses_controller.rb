class AddressesController < ApplicationController
  before_filter :set_addressable

  def create
    @address = @addressable.addresses.new
    # @address.user = current_user
    @address.save
    redirect_to products_path
  end

  private

  def set_addressable
    @addressable = User.find(params[:user_id])
  end

end

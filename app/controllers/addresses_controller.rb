class AddressesController < ApplicationController
  before_filter :set_addressable

  def create
    @address = @addressable.addresses.new(params[:address])
    # @address.user = current_user
    @address.save
    redirect_to products_path
  end

  def edit
    @address = @addressable.addresses.find(params[:address])
  end

  private

  def set_addressable
    @addressable = User.find(params[:user_id])
  end

end

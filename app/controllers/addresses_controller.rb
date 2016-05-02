class AddressesController < ApplicationController
  before_filter :set_addressable

  def create
    @address = @addressable.addresses.new(params[:address])
    # @address.user = current_user
    @address.save
    render nothing: true
  end

  private

  def set_addressable
    @addressable = User.find(params[:user_id])
  end

end

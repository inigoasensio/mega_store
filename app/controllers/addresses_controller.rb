class AddressesController < ApplicationController
  before_filter :set_addressable, only: [ :create ]

  def create
    @address = @addressable.addresses.new(params[:address])
    @address.save
    redirect_to user_path(current_user)
  end

  def edit
    # binding.pry
    # @address = @addressable.addresses.find(params[:address])
  end

  def destroy
    @address = current_user.addresses.find(params[:id])
    @address.destroy
    redirect_to user_path(current_user)
    flash[:success] = "Address deleted successfully"
  end

  private

  def set_addressable
    @addressable = User.find(params[:user_id])
  end

end

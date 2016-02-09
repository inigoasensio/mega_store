class PaymentsController < ApplicationController
  respond_to :html, :json

  # GET
  def index
    @payments = payment.all
    respond_with(@payments)
  end

  def new
    @payment = payment.new(params)
  end

  # POST create
  def create
    @payment = payment.new(params)
    @payment.save
  end

  # GET
  def show
    find_payment
    respond_with(@payment)
  end

  # PUT
  def update

  end

  # DELETE
  def destroy
    find_payment
    @payment.update_attribute(voided_at: Date.current)
  end

  private

  def find_payment
    @payment = payment.find(params[:id])
  end
end

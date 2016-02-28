require 'rails_helper'

RSpec.describe OrderItemsController, :type => :controller do

  before :each do
    user = User.new
    sign_in user
  end

  let(:order) { double('CurrentOrder') }
  let(:order_item) { stub_model(OrderItem, id: 7, product: product) }
  let(:product) { stub_model(Product, id: 3) }

  describe 'GET #index' do
    it 'returns all order items' do
      expect(order_item).to receive(:all)
      get :index
    end
  end

  describe 'POST #create' do
    it 'creates a new order' do
      post :create, { order_item: order_item }
      expect(response).to be_success
    end

    it 'redirects to cart when errors' do
      allow(order_item).to receive(:valid?).and_return false
      post :create
      expect(controller).to redirect_to cart_path
    end
  end

  describe 'PUT #update' do
    it 'updates an order_item' do
      put :update
    end
  end

  describe 'PUT #update' do
    it 'destroys an order_item' do
      delete :destroy
    end
  end
end

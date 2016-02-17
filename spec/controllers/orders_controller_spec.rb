require 'rails_helper'

RSpec.describe OrdersController, :type => :controller do


  let(:order) { stub_model(Order, id: 7) }
  let(:order_item) { stub_model(OrderItem, id: 5) }
  let(:product_id) { 2 }

  describe 'GET #index' do
    it 'returns all orders' do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST #create' do
    it 'creates a new order' do
      allow(Order).to receive(:find).and_return order
      allow(order).to receive(:order_items).and_return product_id
      post :create, { order: { order_item_id: 1 } }
      expect(assigns(:order)).to be_a_new(Order)
      expect(response).to redirect_to(orders_path)
    end
  end

end

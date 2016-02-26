require 'rails_helper'

RSpec.describe OrderItemsController, :type => :controller do

  let(:order_item) { stub_model(OrderItem, id: 7) }
  let(:product) { stub_model(Product) }

  describe 'GET #index' do
    it 'returns all order items' do
      get :index
      expect(response).to have_http_status(:found)
    end
  end

  describe 'POST #create' do
    it 'creates a new order' do
      post :create, order_item: order_item
      expect(response).to have_http_status(:ok)
    end
  end

end

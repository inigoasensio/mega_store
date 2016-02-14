require 'rails_helper'

RSpec.describe OrdersController, :type => :controller do


  let(:order) { stub_model(Order, id: 7) }

  describe 'GET #index' do
    it 'returns all orders' do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST #create' do
    it 'creates a new order' do
      allow(Order).to receive(:find).and_return order
      post :create
    end
  end

end

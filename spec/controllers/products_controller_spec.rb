require 'rails_helper'

RSpec.describe ProductsController, :type => :controller do

  before do
    sign_in @user
  end

  let(:product) { stub_model(Product, id: 8) }

  describe 'GET #index' do
    it 'returns all products' do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST #create' do
    it 'creates a new product' do
      post :create
    end
  end

  describe 'GET #show' do
    it 'finds a product with given id' do
      allow(Product).to receive(:find).and_return product
      get :show, id: '8'
      expect(assigns(:product)).to eq(product)
    end
  end

  describe 'DELETE #destroy' do
    it 'soft deletes a product' do
      allow(Product).to receive(:find).and_return product
      delete :destroy, id: '8'
      expect(response).to have_http_status(:ok)
    end
  end

end

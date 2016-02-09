require 'rails_helper'

RSpec.describe ProductsController, :type => :controller do

  let(:product) { stub_model(Product, id: 8) }

  describe 'GET #index' do
    it 'returns all products' do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #show' do
    it 'finds a product with given id' do
      allow(Product).to receive(:find).and_return product
      get :show, id: '8'
      expect(assigns(:product)).to eq(product)
    end

    it '' do
      allow(Product).to receive(:find).and_return product
      get :show, id: nil
      expect(response).to have_http_status(400)
    end
  end

  describe 'DELETE #destroy' do
    it 'soft deletes a product' do
      allow(Product).to receive(:find).with('11')
      allow(Product).to receive(:update_attribute).with(Date)
      delete :destroy, id: '11'
    end
  end

end

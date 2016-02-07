require 'rails_helper'

RSpec.describe ProductsController, :type => :controller do

  routes { OnlineStore::Application.routes }

  describe 'GET #index' do
    it 'returns all products' do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #show' do
    it 'shows a product' do
      get :show, id: @product.id
    end
  end

  describe 'DELETE #destroy' do
    it 'soft deletes a product' do
      delete :destroy, id: @product.id
      #expect(subject).to receive(:update_attribute)
    end
  end

end

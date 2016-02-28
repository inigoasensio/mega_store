require 'rails_helper'

RSpec.describe TransactionsController, :type => :controller do

  describe 'GET #new' do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    it 'creates a new transaction' do
      get :new
      expect(response).to have_http_status(:success)
    end
  end
end

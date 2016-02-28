require 'rails_helper'

RSpec.describe OnlineStore::Application, type: :routing do

  routes { OnlineStore::Application.routes }

  describe 'Products routes' do
    it do
      expect(get: products_path).to route_to(controller: 'products', action: 'index')
    end

    it do
      expect(get: product_path(:id)).
        to route_to(controller: 'products', action: 'show', id: 'id')
    end

    it do
      expect(delete: 'products/7').
        to route_to(controller: 'products', action: 'destroy', id: '7')
    end
  end

end

require 'rails_helper'

RSpec::describe Order, type: :model do

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:shipper) }
    it { is_expected.to have_many(:purchases) }
    it { is_expected.to have_many(:order_items) }
  end

  describe 'attributes' do
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:status) }
    it { is_expected.to validate_presence_of(:order_date) }
  end
end

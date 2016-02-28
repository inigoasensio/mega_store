require 'rails_helper'

RSpec::describe Purchase, type: :model do

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:credit_card) }
    it { is_expected.to belong_to(:order) }
    it { is_expected.to have_one(:shipping_address) }
    it { is_expected.to have_one(:billing_address) }
  end

  describe 'attributes' do
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:status) }
    it { is_expected.to validate_presence_of(:purchase_type) }
    it { is_expected.to validate_presence_of(:purchase_date) }
  end

  describe 'callbacks' do

  end
end

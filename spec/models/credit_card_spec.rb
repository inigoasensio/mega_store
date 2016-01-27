require 'rails_helper'

RSpec::describe CreditCard, type: :model do

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :user_id }
    it { is_expected.to validate_presence_of :card_type }
    it { is_expected.to validate_presence_of :cardholder_name }
    it { is_expected.to validate_presence_of :cvv }
    it { is_expected.to validate_presence_of :expiration_month }
    it { is_expected.to validate_presence_of :expiration_year }
  end
end

require 'rails_helper'

RSpec::describe CreditCard, type: :model do

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:purchase) }
    it { is_expected.to have_many(:addresses) }
  end

  describe 'attributes' do
    it { is_expected.to allow_mass_assignment_of(:card_type) }
    it { is_expected.to allow_mass_assignment_of(:cardholder_name) }
    it { is_expected.to allow_mass_assignment_of(:country_of_issuance) }
    it { is_expected.to allow_mass_assignment_of(:cvv) }
    it { is_expected.to allow_mass_assignment_of(:expiration_month) }
    it { is_expected.to allow_mass_assignment_of(:expiration_year) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :card_type }
    it { is_expected.to validate_presence_of :cardholder_name }
    it { is_expected.to validate_presence_of :cvv }
    it { is_expected.to validate_presence_of :expiration_month }
    it { is_expected.to validate_presence_of :expiration_year }
  end
end

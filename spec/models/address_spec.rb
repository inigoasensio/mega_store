require 'rails_helper'

RSpec::describe Address, type: :model do

  describe 'associations' do
    it { is_expected.to belong_to(:addressable) }
  end

  describe 'attributes' do
    it { is_expected.to allow_mass_assignment_of(:address1) }
    it { is_expected.to allow_mass_assignment_of(:address_type) }
    it { is_expected.to allow_mass_assignment_of(:city) }
    it { is_expected.to allow_mass_assignment_of(:country) }
    it { is_expected.to allow_mass_assignment_of(:postal_code) }
    it { is_expected.to allow_mass_assignment_of(:state) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:address1) }
    it { is_expected.to validate_presence_of(:city) }
    it { is_expected.to validate_presence_of(:country) }
    it { is_expected.to validate_presence_of(:address_type) }
    it { is_expected.to validate_presence_of(:postal_code) }
    it { is_expected.to validate_presence_of(:state) }
  end
end

require 'rails_helper'

RSpec::describe Supplier, type: :model do

  describe 'associations' do
    it { is_expected.to have_many(:addresses) }
  end

  describe 'attributes' do
    it { is_expected.to allow_mass_assignment_of(:name) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end
end

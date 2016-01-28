require 'rails_helper'

RSpec::describe User, type: :model do

  describe 'associations' do
    it { is_expected.to have_one(:credit_card) }
    it { is_expected.to have_many(:addresses) }
  end
end

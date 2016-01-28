require 'rails_helper'

RSpec::describe Product, type: :model do

  describe 'associations' do
    it { is_expected.to belong_to(:supplier) }
    it { is_expected.to belong_to(:category) }
  end
end


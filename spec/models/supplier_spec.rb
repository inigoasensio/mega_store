require 'rails_helper'

RSpec::describe Supplier, type: :model do

  describe 'associations' do
    it { is_expected.to have_many(:addresses) }
  end
end

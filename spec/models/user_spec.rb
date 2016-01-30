require 'rails_helper'

RSpec::describe User, type: :model do

  describe 'associations' do
    it { is_expected.to have_one(:credit_card) }
    it { is_expected.to have_many(:addresses) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }

    it { is_expected.to have_attached_file(:avatar) }
    it { is_expected.to validate_attachment_presence(:avatar) }
    it { is_expected.to validate_attachment_content_type(:avatar).
      allowing('image/png', 'image/jpeg').
      rejecting('text/plain', 'text/xml') }
    it { is_expected.to validate_attachment_size(:avatar).less_than(1.megabytes) }
  end
end

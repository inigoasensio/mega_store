require 'rails_helper'

RSpec::describe Category, type: :model do

  describe 'associations' do
    it { is_expected.to have_many(:subcategories).class_name('Category')
      .with_foreign_key('category_id') }
    it { is_expected.to belong_to(:category).class_name('Category') }
  end
end

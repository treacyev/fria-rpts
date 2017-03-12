require 'rails_helper'

RSpec.describe Review, type: :model do
  describe '.create' do
    it 'is invalid without an attachment' do
      expect(FactoryGirl.build(:review, attachment: nil)).to be_invalid
    end
  end
end

require 'rails_helper'

RSpec.describe User, type: :model do
  describe '.create' do

    it 'is valid with valid attributes' do
      expect(FactoryGirl.build(:user)).to be_valid
    end 

    it 'is invalid without a first name' do
      expect(FactoryGirl.build(:user, first_name: nil)).to be_invalid
    end

    it 'is invalid without a last name' do
      expect(FactoryGirl.build(:user, last_name: nil)).to be_invalid
    end

    it 'is invalid without a department' do
      expect(FactoryGirl.build(:user, department: nil)).to be_invalid
    end

    it 'is invalid without a rank' do
      expect(FactoryGirl.build(:user, rank: nil)).to be_invalid
    end

    it 'is invalid without a contact number' do
      expect(FactoryGirl.build(:user, contact_number: nil)).to be_invalid
    end

    it 'is invalid with a duplicate email' do
      duplicate = FactoryGirl.create(:user, email: "duplicate@gmail.com")
      expect(FactoryGirl.build(:user, email: "duplicate@gmail.com")).to be_invalid
    end
  end
end

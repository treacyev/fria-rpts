require 'rails_helper'

RSpec.describe Proposal, type: :model do
  describe '.create' do
    it 'is valid when it has valid parameters' do
      expect(FactoryGirl.build(:user_with_proposal)).to be_valid
    end

    it { is_expected.to belong_to :user}

    it 'is invalid without a title' do
      expect(FactoryGirl.build(:proposal, title: nil)).to be_invalid
    end
    it 'is invalid without a principal researcher' do
      expect(FactoryGirl.build(:proposal, principal_researcher: nil)).to be_invalid
    end
    it 'is invalid without objectives' do
      expect(FactoryGirl.build(:proposal, objectives: nil)).to be_invalid
    end
    it 'is invalid without a expected outputs' do
      expect(FactoryGirl.build(:proposal, expectedOutputs: nil)).to be_invalid
    end
    it 'is invalid without a Description of Work Done and Accomplishemnts' do
      expect(FactoryGirl.build(:proposal, description: nil)).to be_invalid
    end
    it 'is invalid without Estimated Number of Hours Per Week Devoted to this Project' do
      expect(FactoryGirl.build(:proposal, weeklyHours: nil)).to be_invalid
    end
    it 'is invalid without an answer in endorsement' do
      expect(FactoryGirl.build(:proposal, endorsement: nil)).to be_invalid
    end
    it 'is invalid without an answer in Have you submitted this proposal to any other funding agency' do
      expect(FactoryGirl.build(:proposal, submitAgency: nil)).to be_invalid
    end
    it 'is invalid without an attachment' do
      expect(FactoryGirl.build(:proposal, attachment: nil)).to be_invalid
    end
  end
end

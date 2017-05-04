require 'rails_helper'

RSpec.describe ProposalsController, :type => :controller do
  before :each do
    @user = FactoryGirl.create(:user)
  #  @proposal = FactoryGirl.create(:proposal, user: @user)
    @proposal_attributes = FactoryGirl.attributes_for(:proposal, :user_id => @user)
  end

  describe 'POST create' do
    describe  'with valid params' do
      it 'creates a new Proposal' do
        expect{
          @proposal = FactoryGirl.create(:proposal, user: @user)
        }.to change(Proposal, :count).by(1)
      end
    end
  end




end
{:user_id => @user, :proposal => @proposal_attributes}

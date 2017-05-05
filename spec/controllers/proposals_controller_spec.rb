require 'rails_helper'

RSpec.describe ProposalsController, :type => :controller do
  before :each do
    @user = FactoryGirl.create(:user)
    @proposal = FactoryGirl.create(:proposal, user: @user)
    @proposal_attributes = FactoryGirl.attributes_for(:proposal, :user_id => @user)
    @proposal_update_attributes = FactoryGirl.attributes_for(:proposal, :title => "Other Proposal", :user_id => @user)
    @proposal_status_update_attributes = FactoryGirl.attributes_for(:proposal, :status => -2, :user_id => @user)
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

  describe "GET show" do
    it "assigns the requested proposal as @proposal" do
      get :show, params: { :user_id => @proposal, :id => @proposal }
      expect(assigns(:proposal)).to eq(@proposal)
    end
  end

  describe "cancel" do
    it "assigns the requested proposal as @proposal" do
      get :show, params: { :user_id => @proposal, :id => @proposal }
      expect(assigns(:proposal)).to eq(@proposal)
    end

    it "updates the requested proposal" do
      put :update, params: {
        :user_id => @user,
        :id => @proposal.id,
        :proposal => @proposal_status_update_attributes
      }
      expect(assigns(:proposal)).to eq(@proposal)
    end

    it "changes the value of status" do
      put :update, params: {
        :user_id => @user,
        :id => @proposal.id,
        :proposal => @proposal_status_update_attributes
      }
      expect(ProposalsController.cancel).to change{@proposal}.by(-2)
    end

  end




end

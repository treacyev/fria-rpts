require 'rails_helper'

RSpec.describe ProposalsController, :type => :controller do
  before :each do
    @user = FactoryGirl.create(:user)
    @proposal = FactoryGirl.create(:proposal, user: @user)
    @proposal_attributes = FactoryGirl.attributes_for(:proposal, :user_id => @user)
    @proposal_update_attributes = FactoryGirl.attributes_for(:proposal, :title => "Other Proposal", :user_id => @user)
    @proposal_status_update_attributes = FactoryGirl.attributes_for(:proposal, :status => -2, :user_id => @user)
  end

  describe "GET show" do
    it "assigns the requested proposal as @proposal" do
      get :show, params: { :user_id => @proposal, :id => @proposal }
      expect(assigns(:proposal)).to eq(@proposal)
    end
  end

  describe "GET new" do
     it "assigns a new proposal for a user" do
      get :new, params: { :user_id => @user }
      expect(assigns(:proposal)).to be_a_new(Proposal)
    end
  end

  describe "GET edit" do
    it "assigns the requested proposal as @user.proposal" do
      get :edit, params: { :user_id => @user, :id => @proposal }
      expect(assigns(:proposal)).to eq(@proposal)
   end
  end

  describe 'POST create' do
    describe 'with valid params' do
      it 'creates a new Proposal' do
        expect{
        @proposal = FactoryGirl.create(:proposal, user: @user)
        }.to change(Proposal, :count).by(1)
      end

      it "assigns a newly created proposal as @proposal" do
        post :create, params: { :user_id => @user, :proposal => @proposal_attributes }
        expect(assigns(:proposal)).to be_a(Proposal)
      end

      it "shows the proposal created" do
        post :create, params: { :user_id => @user, :proposal => @proposal_attributes }
        expect(response.status).to eq(200)
      end
    end

    describe 'with invalid params' do
      it "does not save the new contact" do
        expect{
        post :create, params: { :user_id => @user, id: @proposal, proposal: FactoryGirl.attributes_for(:proposal, :title => nil, :user_id => @user)}
      }.to_not change(Proposal,:count)
      end

      it "renders the 'new' template" do
        post :create, params: { :user_id => @user, id: @proposal, proposal: FactoryGirl.attributes_for(:proposal, :title => nil, :user_id => @user)}
        expect(response).to render_template('new')
      end
    end
  end

  describe "PUT update" do
    describe 'with valid params' do
      it "assigns the requested proposal as @user.proposal" do
        get :edit, params: { :user_id => @user, :id => @proposal }
        expect(assigns(:proposal)).to eq(@proposal)
      end

      it "shows the proposal created" do
        post :create, params: { :user_id => @user, :proposal => @proposal_attributes }
        expect(response.status).to eq(200)
      end
    end

    describe "with invalid params"do
      it "renders the 'edit' template" do
        put :update, params: { :user_id => @user, id: @proposal, proposal: FactoryGirl.attributes_for(:proposal, :title => nil, :user_id => @user)}
        expect(response).to render_template('edit')
      end
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

    it "changes the status of the proposal" do
      put :update, params:{
        id: @proposal,
        proposal: FactoryGirl.attributes_for(:proposal, status: -2)
      }
      @proposal.reload
      expect(@proposal.status).to eq(-2)
    end
  end

  describe "destroy" do
    it "assigns the requested proposal as @proposal" do
      get :show, params: { :user_id => @proposal, :id => @proposal }
      expect(assigns(:proposal)).to eq(@proposal)
    end

    it 'completely deletes a Proposal' do
      expect{
      delete :destroy, params: {id: @proposal}
      }.to change(Proposal, :count).by(-1)
    end

    it "redirects to proposals_path" do
      delete :destroy, params: {id: @proposal}
      expect(response).to redirect_to(proposals_url)
    end
  end

end

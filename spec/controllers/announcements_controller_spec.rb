require 'rails_helper'

RSpec.describe AnnouncementsController, :type => :controller do
  before :each do
    @announcement = FactoryGirl.create(:announcement)
    @announcement_attributes = FactoryGirl.attributes_for(:announcement)
    @announcement_update_attributes = FactoryGirl.attributes_for(:announcement, :title => "Other Announcement")
  end

  describe "GET show" do
    it "assigns the requested announcement as @announcement" do
      get :show, params: { :id => @announcement }
      expect(assigns(:announcement)).to eq(@announcement)
    end
  end

  describe "GET new" do
     it "assigns a new announcement for a user" do
      get :new, params: {}
      expect(assigns(:announcement)).to be_a_new(Announcement)
    end
  end

  describe "GET edit" do
    it "assigns the requested announcement as @announcement" do
      get :show, params: { :id => @announcement }
      expect(assigns(:announcement)).to eq(@announcement)
    end
  end

  describe 'POST create' do
    describe 'with valid params' do
      it 'creates a new Announcement' do
        expect{
        @announcement = FactoryGirl.create(:announcement)
        }.to change(Announcement, :count).by(1)
      end

      it "assigns a newly created announcement as @announcement" do
        post :create, params: { :announcement => @announcement_attributes }
        expect(assigns(:announcement)).to be_a(Announcement)
      end
    end

    describe 'with invalid params' do
      it "does not save the new contact" do
        expect{
        post :create, params: { id: @announcement, announcement: FactoryGirl.attributes_for(:announcement, :title => nil)}
      }.to_not change(Announcement,:count)
      end

      it "renders the 'new' template" do
        post :create, params: { id: @announcement, announcement: FactoryGirl.attributes_for(:announcement, :title => nil)}
        expect(response).to render_template('new')
      end
    end
  end

  describe "PUT update" do
    describe 'with valid params' do
      it "assigns the requested announcement as @user.announcement" do
        get :edit, params: {:id => @announcement }
        expect(assigns(:announcement)).to eq(@announcement)
      end
    end

    describe "with invalid params"do
      it "renders the 'edit' template" do
        put :update, params: { id: @announcement, announcement: FactoryGirl.attributes_for(:announcement, :title => nil)}
        expect(response).to render_template('edit')
      end
    end
  end

  describe "destroy" do
    it "assigns the requested announcement as @announcement" do
      get :show, params: { :id => @announcement }
      expect(assigns(:announcement)).to eq(@announcement)
    end

    it 'completely deletes a Announcement' do
      expect{
      delete :destroy, params: {id: @announcement}
      }.to change(Announcement, :count).by(-1)
    end

    it "redirects to announcements_path" do
      delete :destroy, params: {id: @announcement}
      expect(response).to redirect_to(announcements_url)
    end
  end
end

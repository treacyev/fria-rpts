# require 'rails_helper'
#
# Rspec.describe ReviewsController, :type => controller do
#   before :each do
#     @user = FactoryGirl.create(:user)
#     @review = FactoryGirl.create(:review, user: @user)
#     @review_attributes = FactoryGirl.attributes_for(:review, :user_id => @user)
#   end
#
#   describe 'POST create' do
#     describe  'with valid params' do
#       it 'creates a new review' do
#         expect{
#         @review = FactoryGirl.create(:review, user: @user)
#         }.to change(review, :count).by(1)
#       end
#
#       it "assigns a newly created review as @review" do
#         post :create, params: { :user_id => @user, :review => @review_attributes }
#         expect(assigns(:review)).to be_a(review)
#       end
#
#       it "shows the review created" do
#         post :create, params: { :user_id => @user, :review => @review_attributes }
#         expect(response.status).to eq(200)
#       end
#     end
#   end
# end

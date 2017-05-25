class UsersController < ApplicationController
    before_action :authenticate_user!

    def show
        authorize! :show, User
        @user = User.find(params[:id])
    end

    def activate
        @user = User.find(params[:id])
        authorize! :activate, @user
    
        @user.update(activated?: true)
        @user.save

        redirect_to :root
    end

    def destroy
        @user = User.find(params[:id])
        authorize! :destroy, @user

        @user.destroy

        redirect_to :root
    end
end
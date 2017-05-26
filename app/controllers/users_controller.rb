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

    def deactivate
        @user = User.find(params[:id])
        authorize! :deactivate, @user

        if @user.type == 'Researcher'
            @user.update(activated?: false)
            @user.save
        end 
        
        redirect_to :root
    end
end
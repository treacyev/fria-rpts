class UsersController < ApplicationController
    before_action :authenticate_user!

    def show
        authorize! :show, User
        @user = User.find(params[:id])
    end
end
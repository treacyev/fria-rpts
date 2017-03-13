class LandingPageController < ApplicationController
    def index
        @proposals = Proposal.all
        @user = User.new
    end
end
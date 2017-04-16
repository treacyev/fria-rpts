class LandingPageController < ApplicationController
    def index
        @proposals = Proposal.all
        @user = User.new
        @announcements = Announcement.where(:isDraft => false)
    end
end
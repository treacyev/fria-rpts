class LandingPageController < ApplicationController
    def index
        @proposals = Proposal.all
        @user = User.new
        @announcements = Announcement.where(:isDraft => false)
        @current_time = Time.now.strftime('%Q')
    end
end
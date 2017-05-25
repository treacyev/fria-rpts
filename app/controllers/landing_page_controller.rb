class LandingPageController < ApplicationController
    def index
        @user = User.new
        if current_user && current_user.type == 'CommitteeHead'
            @announcements = Announcement.all.order('id DESC')
        else
            @announcements = Announcement.where(:isDraft => false).order('id DESC')
        end
        @current_time = Time.now.to_i
        if current_user && current_user.type == 'Researcher'
            @proposals = current_user.proposals.last(5).reverse
            render 'researcher_page/home'
        elsif current_user && current_user.type == 'Dean'
            @proposals = Proposal.where(head_vote: 2).last(5).reverse
        elsif current_user && current_user.type == 'Admin'
            @users = User.all.order('id DESC')
            authorize! :index, User 
            render 'admin/home'
        elsif current_user
            @proposals = Proposal.where(:is_draft => false).last(5).reverse
            render 'researcher_page/home'
        else
            @proposals = Proposal.where(status: 2).last(5).reverse
        end
    end
end

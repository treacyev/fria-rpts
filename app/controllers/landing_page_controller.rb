class LandingPageController < ApplicationController
    def index
        @user = User.new
        @announcements = Announcement.where(:isDraft => false)
        @current_time = Time.now.to_i
        if current_user && current_user.type == 'Researcher'
            @proposals = current_user.proposals.last(5).reverse
            render 'researcher_page/home'
        elsif current_user && current_user.type != 'Admin'
            @proposals = Proposal.last(5).reverse
            render 'researcher_page/home'
        else
            @proposals = Proposal.where(status: 2).last(5).reverse
        end
    end

    def researcher_submit	#DELETE LATER
    end	

    def researcher_proposal	#DELETE LATER
    end

    def researcher_view #DELETE LATER
    end

    def member_home #DELETE LATER
    end

    def member_proposals #DELETE LATER
    end

    def member_archive #DELETE LATER
    end

    def head_proposals #DELETE LATER
    end

    def head_home #DELETE LATER
    end

end

class LandingPageController < ApplicationController
    def index
        @proposals = Proposal.all
        @user = User.new
        @announcements = Announcement.where(:isDraft => false)
        @current_time = Time.now.to_i
    end
<<<<<<< HEAD
end
	
=======

    def researcher_home #DELETE LATER
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
end
>>>>>>> c7c1d6c61b4ee04846bf33d1d592ea4453bd3861

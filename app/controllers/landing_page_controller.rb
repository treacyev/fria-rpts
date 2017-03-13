class LandingPageController < ApplicationController
    def index
        @proposals = Proposal.all
    end
end
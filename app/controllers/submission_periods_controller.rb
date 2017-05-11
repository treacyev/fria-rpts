class SubmissionPeriodsController < ApplicationController
    def toggle
        authorize! :toggle, SubmissionPeriod
        @submission_period = SubmissionPeriod.first
        @submission_period.active = !@submission_period.active
        if @submission_period.active
            Researcher.all.update_all(submitted: false)
        end
        @submission_period.save
        redirect_back(fallback_location: root_path)
    end
end
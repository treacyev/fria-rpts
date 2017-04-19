class ProposalsController < ApplicationController
  def index
    @proposal_status = ['Pending', 'Resubmit', 'Accepted', 'Canceled', 'Denied']
    if current_user && current_user.type == "Researcher"
      @proposals = Proposal.where(user_id: current_user.id)
    else
      @proposals = Proposal.all
    end
  end

  def show
    @proposal = Proposal.find(params[:id])
  end

  def new
    @proposal = Proposal.new
  end

  def edit
    @proposal = Proposal.find(params[:id])
  end

  def create
    @proposal = Proposal.new(proposal_params)

    if @proposal.save
      redirect_to @proposal
    else
      render 'new'
    end
  end

  def update
    @proposal = Proposal.find(params[:id])

    if @proposal.update(proposal_params)
      redirect_to @proposal
    else
      render 'edit'
    end
  end

  def cancel
    @proposal = Proposal.find(params[:id])

    @proposal.update_attribute(:status, -2)

    redirect_to proposals_path
  end

  def destroy
    @proposal = Proposal.find(params[:id])
    @proposal.destroy

    redirect_to proposals_path
  end

  private
    def proposal_params
      params.require(:proposal).permit(:title, :principalResearcher, :coresearchers, :rdCost, :sourceExternal, :amountExternal, :facMat, :objectives, :expectedOutputs, :description, :weeklyHours, :endorsement, :submitAgency, :listAgency, :attachment, :status, :user_id)
    end
end

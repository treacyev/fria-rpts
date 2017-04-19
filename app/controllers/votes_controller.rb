class VotesController < ApplicationController
  def index
      @votes = Vote.all
  end

  def show
    @vote = Vote.find(params[:id])
  end

  def new
    @vote = Vote.new
  end

  def edit
    @vote = Vote.find(params[:id])
  end

  def create
    @vote = Vote.new(vote_params)

    if @vote.save
      redirect_to @vote
    else
      render 'new'
    end
  end

  def update
    @vote = Vote.find(params[:id])

    if @vote.update(vote_params)
      redirect_to @vote
    else
      render 'edit'
    end
  end

  def destroy
    @vote = Vote.find(params[:id])
    @vote.destroy

    redirect_to vote_path
  end

  private
    def vote_params
      params.require(:vote).permit(:decision)
    end
end

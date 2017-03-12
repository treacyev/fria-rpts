class ProposalsController < ApplicationController
  def new
  end
  def create
      render plain: params[:proposal].inspect
  end
end

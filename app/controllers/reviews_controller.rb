class ReviewsController < ApplicationController
  def index
      @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
  end

  def new
    @review = Review.new
  end

  def edit
    @review = Review.find(params[:id])
  end

  def create
    authorize! :create, Review
    @review = Review.new(review_params)
    if current_user.reviews.where('proposal_id = ?', @review.proposal_id).length > 0
      flash[:negative] = "You can only give a review once per proposal"
      redirect_to :back and return
    end
    @review.user_id = current_user.id

    if params[:commit] == "Reject"
      @review.vote = -1
    elsif params[:commit] == "Accept"
      @review.vote = 2
    elsif params[:commit] == "Resubmit"
      @review.vote = 1
    end
    
    @review.save

    redirect_to :back
  end

  def update
    @review = Review.find(params[:id])

    if @review.update(review_params)
      redirect_to @review
    else
      render 'edit'
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy

    redirect_to reviews_path
  end

  private
    def review_params
      params.require(:review).permit(:attachment, :vote, :comment, :proposal_id)
    end
end

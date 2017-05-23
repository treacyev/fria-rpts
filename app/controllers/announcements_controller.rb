class AnnouncementsController < ApplicationController
  def index
      @announcements = Announcement.all
  end

  def show
    authorize! :show, Announcement
    @announcement = Announcement.find(params[:id])
  end

  def new
    authorize! :create, Announcement
    @announcement = Announcement.new
  end

  def edit
    authorize! :edit, Announcement
    @announcement = Announcement.find(params[:id])
  end

  def create
    authorize! :create, Announcement
    
    @announcement = Announcement.new(announcement_params)

    if params[:commit] == "Save as Draft"
      @announcement.isDraft = true
    elsif params[:commit] == "Submit"
      @announcement.isDraft = false
    end

    if @announcement.save
      redirect_to :root
    else
      render 'new'
    end
  end

  def update
    authorize! :edit, Announcement
    
    @announcement = Announcement.find(params[:id])

    if params[:commit] == "Save as Draft"
      @announcement.isDraft = true
    elsif params[:commit] == "Submit"
      if @announcement.isDraft
        @announcement.isDraft = true
        @announcement.created_at = Time.now
      end
      @announcement.isDraft = false
    end

    if @announcement.update(announcement_params)
      redirect_to :root
    else
      render 'edit'
    end
  end

  def destroy
    authorize! :destroy, Announcement
    
    @announcement = Announcement.find(params[:id])
    @announcement.destroy

    redirect_to :root
  end

  private
    def announcement_params
      params.require(:announcement).permit(:title, :text, :isDraft)
    end
end

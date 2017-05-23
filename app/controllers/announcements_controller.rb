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
      @announcement.is_draft = true
    elsif params[:commit] == "Submit"
      @announcement.is_draft = false
    end

    if @announcement.save
      redirect_to @announcement
    else
      render 'new'
    end
  end

  def update
    authorize! :edit, Announcement
    
    @announcement = Announcement.find(params[:id])

    if @announcement.update(announcement_params)
      redirect_to @announcement
    else
      render 'edit'
    end
  end

  def destroy
    authorize! :destroy, Announcement
    
    @announcement = Announcement.find(params[:id])
    @announcement.destroy

    redirect_to announcements_path
  end

  private
    def announcement_params
      params.require(:announcement).permit(:title, :text, :isDraft)
    end
end

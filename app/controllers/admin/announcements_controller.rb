module Admin
  class AnnouncementsController < AdminBaseController
    before_action :set_announcement, only: [:edit, :update, :destroy]

    def index
      @announcements = current_site.announcements.order(created_at: :desc)
    end

    def new
      @announcement = current_site.announcements.build
    end

    def create
      @announcement = current_site.announcements.build(announcement_params)
      if @announcement.save
        redirect_to admin_announcements_path, notice: "Announcement posted!"
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit; end

    def update
      if @announcement.update(announcement_params)
        redirect_to admin_announcements_path, notice: "Announcement updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @announcement.destroy
      redirect_to admin_announcements_path, notice: "Announcement deleted."
    end

    private

    def set_announcement
      @announcement = current_site.announcements.find(params[:id])
    end

    def announcement_params
      params.require(:announcement).permit(:title, :body, :published)
    end
  end
end

class PublicSitesController < ApplicationController
  before_action :find_site

  def show
    @officials = @site.officials.limit(8)
    @announcements = @site.announcements.recent
    @services = @site.services.limit(6)
  end

  def services
    @services = @site.services
  end

  def officials
    @officials = @site.officials
  end

  def transparency; end

  def announcements
    @announcements = @site.announcements.published
  end

  def contact; end

  private

  def find_site
    @site = Site.published.find_by!(slug: params[:slug])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, alert: "Site not found."
  end
end

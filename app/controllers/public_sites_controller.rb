class PublicSitesController < ApplicationController
  layout "public_site"
  before_action :find_site

  def show
    @officials = @site.officials.limit(8)
    @announcements = @site.announcements.recent
    @services = @site.services.limit(6)
  end

  def services
    @services = @site.services
  end

  def charter
    @services = @site.services.includes(:service_steps)
  end

  def charter_service
    @service = @site.services.includes(:service_steps).find(params[:service_id])
  end

  def officials
    @officials = @site.officials
  end

  def transparency; end

  def documents
    @documents = @site.documents.published
    @categories = @documents.group_by(&:category)
  end

  def announcements
    @announcements = @site.announcements.published
  end

  def foi; end

  def create_foi
    @foi_request = @site.foi_requests.build(foi_params)
    if @foi_request.save
      redirect_to public_site_foi_track_path(@site.slug, tracking: @foi_request.tracking_number),
        notice: "Your FOI request has been submitted. Tracking number: #{@foi_request.tracking_number}"
    else
      render :foi, status: :unprocessable_entity
    end
  end

  def foi_track
    if params[:tracking].present?
      @foi_request = @site.foi_requests.find_by(tracking_number: params[:tracking])
    end
  end

  def contact; end

  def emergency
    @contacts = @site.emergency_contacts
    @categories = @contacts.group_by(&:category)
  end

  private

  def find_site
    @site = Site.published.find_by!(slug: params[:slug])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, alert: "Site not found."
  end

  def foi_params
    params.require(:foi_request).permit(:name, :email, :purpose, :description)
  end
end

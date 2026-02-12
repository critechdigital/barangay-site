class SetupController < ApplicationController
  before_action :require_login
  before_action :find_or_build_site

  # Step 1: Basics
  def basics; end

  def update_basics
    if @site.update(basics_params)
      redirect_to officials_setup_path, notice: "Basics saved!"
    else
      render :basics, status: :unprocessable_entity
    end
  end

  # Step 2: Officials
  def officials
    if @site.officials.empty?
      # Pre-populate with common positions
      Site::OFFICIAL_POSITIONS.each_with_index do |pos, i|
        @site.officials.build(position: pos, sort_order: i)
      end
    end
  end

  def update_officials
    if @site.update(officials_params)
      redirect_to services_setup_path, notice: "Officials saved!"
    else
      render :officials, status: :unprocessable_entity
    end
  end

  # Step 3: Services
  def services
    if @site.services.empty?
      Site::COMMON_SERVICES.each_with_index do |svc, i|
        @site.services.build(svc.merge(sort_order: i))
      end
    end
  end

  def update_services
    if @site.update(services_params)
      redirect_to contact_setup_path, notice: "Services saved!"
    else
      render :services, status: :unprocessable_entity
    end
  end

  # Step 4: Contact
  def contact; end

  def update_contact
    if @site.update(contact_params)
      redirect_to preview_setup_path, notice: "Contact info saved!"
    else
      render :contact, status: :unprocessable_entity
    end
  end

  # Step 5: Preview & Publish
  def preview; end

  def do_publish
    @site.update!(published: true)
    redirect_to public_site_path(@site.slug), notice: "🎉 Your barangay site is now live!"
  end

  private

  def find_or_build_site
    @site = current_user.sites.first_or_initialize
    @site.save(validate: false) if @site.new_record?
  end

  def basics_params
    params.require(:site).permit(:name, :slug, :tagline, :region, :province, :municipality, :barangay, :primary_color, :secondary_color)
  end

  def officials_params
    params.require(:site).permit(officials_attributes: [:id, :name, :position, :sort_order, :_destroy])
  end

  def services_params
    params.require(:site).permit(services_attributes: [:id, :name, :description, :requirements, :fees, :processing_time, :category, :sort_order, :_destroy])
  end

  def contact_params
    params.require(:site).permit(:phone, :email, :address, :office_hours, :latitude, :longitude)
  end
end

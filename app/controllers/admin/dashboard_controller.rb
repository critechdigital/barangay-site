module Admin
  class DashboardController < AdminBaseController
    def index
      @site = current_site
      @officials_count = @site&.officials&.count || 0
      @services_count = @site&.services&.count || 0
      @announcements_count = @site&.announcements&.count || 0
    end
  end
end

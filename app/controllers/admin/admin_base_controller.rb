module Admin
  class AdminBaseController < ApplicationController
    before_action :require_login
    before_action :require_site

    private

    def require_site
      unless current_site
        redirect_to basics_setup_path, alert: "Please set up your site first."
      end
    end
  end
end

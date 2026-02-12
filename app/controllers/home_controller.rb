class HomeController < ApplicationController
  def index
    @sites_count = Site.published.count
  end
end

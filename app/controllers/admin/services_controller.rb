module Admin
  class ServicesController < AdminBaseController
    before_action :set_service, only: [:edit, :update, :destroy]

    def index
      @services = current_site.services
    end

    def new
      @service = current_site.services.build
    end

    def create
      @service = current_site.services.build(service_params)
      if @service.save
        redirect_to admin_services_path, notice: "Service added!"
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit; end

    def update
      if @service.update(service_params)
        redirect_to admin_services_path, notice: "Service updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @service.destroy
      redirect_to admin_services_path, notice: "Service removed."
    end

    private

    def set_service
      @service = current_site.services.find(params[:id])
    end

    def service_params
      params.require(:service).permit(:name, :description, :requirements, :fees, :processing_time, :category, :sort_order)
    end
  end
end

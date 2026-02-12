module Admin
  class ServiceStepsController < AdminBaseController
    before_action :set_service
    before_action :set_step, only: [:edit, :update, :destroy]

    def new
      next_step = @service.service_steps.maximum(:step_number).to_i + 1
      @step = @service.service_steps.build(step_number: next_step)
    end

    def create
      @step = @service.service_steps.build(step_params)
      if @step.save
        redirect_to edit_admin_service_path(@service), notice: "Step added!"
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit; end

    def update
      if @step.update(step_params)
        redirect_to edit_admin_service_path(@service), notice: "Step updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @step.destroy
      redirect_to edit_admin_service_path(@service), notice: "Step removed."
    end

    private

    def set_service
      @service = current_site.services.find(params[:service_id])
    end

    def set_step
      @step = @service.service_steps.find(params[:id])
    end

    def step_params
      params.require(:service_step).permit(:step_number, :title, :description, :responsible_person, :location, :duration, :fees, :notes)
    end
  end
end

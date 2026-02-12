module Admin
  class FoiRequestsController < AdminBaseController
    def index
      @requests = current_site.foi_requests.recent
    end

    def show
      @request = current_site.foi_requests.find(params[:id])
    end

    def update
      @request = current_site.foi_requests.find(params[:id])
      if @request.update(foi_params)
        redirect_to admin_foi_request_path(@request), notice: "FOI request updated."
      else
        render :show, status: :unprocessable_entity
      end
    end

    private

    def foi_params
      params.require(:foi_request).permit(:status, :admin_notes, :processed_at, :released_at)
    end
  end
end

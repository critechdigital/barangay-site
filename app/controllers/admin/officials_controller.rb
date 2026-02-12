module Admin
  class OfficialsController < AdminBaseController
    before_action :set_official, only: [:edit, :update, :destroy]

    def index
      @officials = current_site.officials
    end

    def new
      @official = current_site.officials.build
    end

    def create
      @official = current_site.officials.build(official_params)
      if @official.save
        redirect_to admin_officials_path, notice: "Official added!"
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit; end

    def update
      if @official.update(official_params)
        redirect_to admin_officials_path, notice: "Official updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @official.destroy
      redirect_to admin_officials_path, notice: "Official removed."
    end

    private

    def set_official
      @official = current_site.officials.find(params[:id])
    end

    def official_params
      params.require(:official).permit(:name, :position, :photo, :sort_order)
    end
  end
end

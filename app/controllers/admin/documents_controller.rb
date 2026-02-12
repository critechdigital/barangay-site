module Admin
  class DocumentsController < AdminBaseController
    before_action :set_document, only: [:edit, :update, :destroy]

    def index
      @documents = current_site.documents.order(:category, :sort_order)
    end

    def new
      @document = current_site.documents.build
    end

    def create
      @document = current_site.documents.build(document_params)
      if @document.save
        redirect_to admin_documents_path, notice: "Document added!"
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit; end

    def update
      if @document.update(document_params)
        redirect_to admin_documents_path, notice: "Document updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @document.destroy
      redirect_to admin_documents_path, notice: "Document removed."
    end

    private

    def set_document
      @document = current_site.documents.find(params[:id])
    end

    def document_params
      params.require(:document).permit(:title, :description, :category, :file_url, :published, :sort_order)
    end
  end
end

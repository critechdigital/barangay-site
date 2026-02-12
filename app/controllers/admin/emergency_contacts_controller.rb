module Admin
  class EmergencyContactsController < AdminBaseController
    before_action :set_contact, only: [:edit, :update, :destroy]

    def index
      @contacts = current_site.emergency_contacts
    end

    def new
      @contact = current_site.emergency_contacts.build
    end

    def create
      @contact = current_site.emergency_contacts.build(contact_params)
      if @contact.save
        redirect_to admin_emergency_contacts_path, notice: "Emergency contact added!"
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit; end

    def update
      if @contact.update(contact_params)
        redirect_to admin_emergency_contacts_path, notice: "Contact updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @contact.destroy
      redirect_to admin_emergency_contacts_path, notice: "Contact removed."
    end

    private

    def set_contact
      @contact = current_site.emergency_contacts.find(params[:id])
    end

    def contact_params
      params.require(:emergency_contact).permit(:name, :phone, :category, :sort_order)
    end
  end
end

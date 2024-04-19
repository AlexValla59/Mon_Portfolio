class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
  
    if @contact.valid?
      # Assurez-vous que l'adresse "From" est correctement spécifiée ici
      Mailer.contact_form(@contact).deliver_now

      redirect_to contact_path, flash: { success: t(:"create.message_has_been_sent") }
    else
      render :new
    end
  end
  
  

  private

  def contact_params
    params.require(:contact).permit(:firstname, :lastname, :email, :message, :active)
  end
end

# new_contact_path
class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.valid?
      Mailer.contact_form(@contact).deliver
      redirect_to new_contact_path, flash: { success: t(:"create.message_has_been_sent") }
    else
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:firstname, :lastname, :email, :message, :active)
  end
end

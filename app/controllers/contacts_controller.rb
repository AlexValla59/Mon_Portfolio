class ContactsController < ApplicationController
 
  def new
    @contact = Contact.new
  end
 
  def create
    @contact = Contact.new params[:contact]
 
    if @contact.valid?
      Mailer.contact_form(@contact).deliver 
      redirect_to new_contact_path, flash: {success: t(:"create.message_has_been_sent")}
    else
      render :new
    end
  end
 
end
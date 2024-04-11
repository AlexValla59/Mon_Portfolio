class Mailer < ActionMailer::Base
    layout 'mailer'
  
    def contact_form(contact)
      @contact = contact
      @to = "alexandrevalla1@gmail.com" # Remplacez <un email> par l'adresse e-mail à laquelle vous souhaitez envoyer le message.
  
      mail(to: @to, subject: "Nouveau contact depuis le site")
    end
  end
  
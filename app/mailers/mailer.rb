class Mailer < ActionMailer::Base
  layout 'mailer'

  def contact_form(contact)
    @contact = contact
    @to = "alexandrevalla1@gmail.com"
    @from = "alexandrevalla1@gmail.com" # Spécifiez votre adresse "From" ici

    mail(to: @to, from: @from, subject: "Nouveau contact depuis le site")
  end
end

class Mailer < ActionMailer::Base
  layout 'mailer'

  def contact_form(contact)
    @contact = contact
    @to = "alexvalla78@gmail.com"
    @from = "alexvalla78@gmail.com" # Spécifiez votre adresse "From" ici

    mail(to: @to, from: @from, subject: "Nouveau contact depuis le site")
  end
end

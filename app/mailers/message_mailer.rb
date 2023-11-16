# app/mailers/message_mailer.rb
class MessageMailer < ApplicationMailer
  def nouveau_message(message, success_message:)
    @message = message
    @success_message = success_message
    mail(to: 'alexandre.valla@icloud.com', subject: 'Nouveau message reçu') do |format|
      format.html { render 'message_mailer/nouveau_message', layout: 'mailer' }

    end
  end
end




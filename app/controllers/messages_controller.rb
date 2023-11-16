# app/controllers/messages_controller.rb
class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)

    if @message.save
      # Appelle le mailer pour envoyer un e-mail de notification avec le message de succès
      MessageMailer.nouveau_message(@message, success_message: 'Votre message a été envoyé avec succès. Merci!').deliver_now

      redirect_to new_message_path, notice: 'Votre message a été envoyé avec succès. Merci!'
    else
      # Redirige l'utilisateur vers la page de contact avec le message d'erreur
      redirect_to new_message_path, alert: "Désolé, une erreur s'est produite lors de l'envoi de votre message. Veuillez réessayer."
    end
  end

  private

  def message_params
    params.permit(:nom, :email, :sujet, :message)
  end
end


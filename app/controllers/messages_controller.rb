# app/controllers/messages_controller.rb
class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)

    if @message.save
      # Appelle le mailer pour envoyer un e-mail de notification
      MessageMailer.nouveau_message(@message).deliver_now

      redirect_to new_message_path, notice: 'Message envoyé avec succès.'
    else
      # Redirige l'utilisateur vers la page de contact
      redirect_to new_message_path, alert: "Erreur lors de l'envoi du message."
    end
  end

  private

  def message_params
    params.permit(:nom, :email, :sujet, :message)
  end
end


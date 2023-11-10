# app/models/message.rb
class Message < ApplicationRecord
    validates :nom, presence: true
    validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "doit être une adresse e-mail valide" }
    validates :sujet, presence: true
    validates :message, presence: true, length: { minimum: 5 } # exemple de validation, ajuste selon tes besoins
  end
  
class CreationsController < ApplicationController

  def index
    @creations = Creation.all
  end

  def show
    @creation = Creation.find(params[:id])
    @format = @creation.format # Supposons que @creation représente l'enregistrement actuel que vous souhaitez afficher.
    

  end
end

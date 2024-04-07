class VideosController < ApplicationController
  def show
    @video = Video.find(params[:id])
    send_file Rails.root.join('public', @video.path), type: 'video/mp4', disposition: 'inline'
  end
end

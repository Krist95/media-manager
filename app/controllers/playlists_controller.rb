class PlaylistsController < ApplicationController
  def index
    if params[:id]
      playlist = Playlist.find(params[:id])
      render json: playlist
    else
      render json: Playlist.all
    end
  end

  def create
    playlist = Playlist.new(playlist_params)
    playlist.device_id = params[:device_id]
    if playlist.save
      render json: playlist, status: :created
    else
      render json: playlist.errors, status: :unprocessable_entity
    end
  end

  def update_one
    playlist = Playlist.find(params[:id])
    playlist.update(playlist_params)
    render json: playlist
  end

  def destroy
    if params[:id]
      Playlist.destroy(params[:id])
      render json: { message: "Successfully deleted device record with id: #{params[:id]}" }
    else
      Playlist.destroy_all
      render json: { message: 'All device records have been successfully deleted.' }
    end
  end

  private 
    
  def playlist_params
    params.require(:playlist).permit(:device_id, :title, :description)
  end
    
end

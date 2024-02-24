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
    playlist = Playlist.create(playlist_params)
    render json: playlist
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
    params.require(:playlist).permit(:title, :description)
  end
    
end

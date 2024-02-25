class MediaController < ApplicationController
  def index
    if params[:id]
      medium = Medium.find(params[:id])
      render json: medium
    else
      render json: Medium.all
    end
  end

  def create
    medium = Medium.create(medium_params)
    render json: medium
  end

  def update_one
    medium = Medium.find(params[:id])
    medium.update(medium_params)
    render json: medium
  end

  def destroy
    if params[:id]
      Medium.destroy(params[:id])
      render json: { message: "Successfully deleted media record with id: #{params[:id]}" }
    else
      Medium.destroy_all
      render json: { message: 'All media records have been successfully deleted.' }
    end
  end

  def add_to_playlist
    playlist = Playlist.find(params[:playlist_id])
    media = Medium.find(params[:media_id])
    playlist.media << media

    render json: { message: "Success"}
  end

  def get_all_playlist_media
    playlist = Playlist.find(params[:playlist_id])
    media = playlist.media

    render json: media
  end

  private 
    
  def medium_params
    params.require(:medium).permit(:playlist_id, :media_id, :title, :description, :link)
  end
end

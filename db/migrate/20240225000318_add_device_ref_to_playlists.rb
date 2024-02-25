class AddDeviceRefToPlaylists < ActiveRecord::Migration[7.1]
  def change
    add_reference :playlists, :device, null: false, foreign_key: true
  end
end

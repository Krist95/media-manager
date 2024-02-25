class CreateJoinTablePlaylistMedia < ActiveRecord::Migration[7.1]
  def change
    create_join_table :playlists, :media do |t|
      # t.index [:playlist_id, :medium_id]
      # t.index [:medium_id, :playlist_id]
    end
  end
end

class RemoveyoutubeUrlfromtracks < ActiveRecord::Migration
  def up
	remove_column :tracks, :youtube_url
  end

  def down
	add_column :tracks, :youtube_url
  end
end

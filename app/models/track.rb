class Track < ActiveRecord::Base
  attr_accessible :title, :thumbnail_url, :video_id
  validates :video_id, :presence => true

end

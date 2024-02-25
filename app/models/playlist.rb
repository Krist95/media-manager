class Playlist < ApplicationRecord
  belongs_to :device
  has_and_belongs_to_many :media
end

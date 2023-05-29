require_relative 'item'
require 'date'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(publish_date, archived, on_spotify)
    super(publish_date, archived)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && @on_spotify
  end
end

music_album = MusicAlbum.new(Date.new(1968, 11, 22), false, true)
puts music_album.can_be_archived?
# => true

music_album = MusicAlbum.new(Date.new(1968, 11, 22), false, false)
puts music_album.can_be_archived?
# => false

require_relative 'item'
require 'date'

class MusicAlbum < Item
  def initialize(genre, author, label, publish_date, archived)
    super(genre, author, label, publish_date, archived)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && @on_spotify
  end
end

music_album = MusicAlbum.new('Rock', 'The Beatles', 'Apple Records', Date.new(1968, 11, 22), false)
music_album.on_spotify = true
puts music_album.can_be_archived?

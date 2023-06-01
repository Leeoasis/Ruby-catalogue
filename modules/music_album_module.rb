require_relative '../classes/music_album'
require_relative '../classes/genre'
require_relative './utils'
require_relative './genre_module'

module MusicAlbumModule
  include Utils
  include GenreModule
  def list_music_albums
    if @music_albums.empty?
      puts 'No music albums available'
    else
      puts 'List of music albums:'
      @music_albums.each_with_index do |music_album, index|
        print "#{index + 1}. [Album] published on #{music_album.publish_date} "
        puts "genre: #{music_album.genre.name} and is #{music_album.on_spotify ? 'available on spotify' : 'not available on spotify'}"
      end
    end
    puts "\n"
  end

  def add_music_album
    puts 'Enter the music album publish date (YYYY-MM-DD):'
    publish_date = input_date
    print 'Is the music album on Spotify? (Y/N): '
    on_spotify = gets.chomp.downcase
    on_spotify = check_boolean?(on_spotify)
    music_album = MusicAlbum.new(publish_date, on_spotify)
    @music_albums << music_album
    genre = add_genre
    genre.add_item(music_album)
    puts 'music album added successfully!'
    puts "\n"
  end
end

require_relative '../modules/display_menu_options'
require_relative '../modules/music_album_module'

class App
  include DisplayMenuOptions
  include MusicAlbumModule

  def initialize
    @books = []
    @music_albums = []
    @games = []
    @genres = []
  end

  def run
    loop do
      display_menu_options
      option = gets.chomp.to_i
      break if option == 10

      handle_option(option)
    end
  end

  def handle_option(option)
    case option
    when 1
      list_books
    when 2
      list_music_albums
    when 3
      list_games
    when 4
      list_genres
    when 5
      list_label
    when 6
      list_authors
    when 7
      add_book
    when 8
      add_music_album
    when 9
      add_game
    else
      puts 'Invalid option! Please choose a valid option.'
    end
  end
end

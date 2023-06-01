require_relative '../modules/display_menu_options'
require_relative '../modules/book_module'
require_relative '../modules/music_album_module'
require_relative '../modules/game_list_module'
require_relative 'game'
require_relative '../modules/utils'
require_relative '../classes/collections'
require_relative '../modules/author_module'

class App
  include DisplayMenuOptions
  include MusicAlbumModule
  include GameLister
  include Utils
  include Authorlist
  include DisplayMenuOptions
  include BooksUi

  def initialize
    check_data_folder
    @books = []
    @music_albums = Collections.load_data('music_albums').empty? ? [] : Collections.load_data('music_albums')
    @games = Collections.load_data('games').empty? ? [] : Collections.load_data('games')
    @genres = []
    @authors = Collections.load_data('authors').empty? ? [] : Collections.load_data('authors')
    @genres = Collections.load_data('genres').empty? ? [] : Collections.load_data('genres')
    @book_file = 'data/books.json'
    @labels_file = 'data/labels.json'
    @books = if File.exist?(@book_file)
               file_contents = File.read(@book_file)
               file_contents.empty? ? [] : JSON.parse(file_contents)
             else
               []
             end
    @labels = if File.exist?(@labels_file)
                file_contents = File.read(@labels_file)
                file_contents.empty? ? [] : JSON.parse(file_contents)
              else
                []
              end
  end

  def run
    loop do
      display_menu_options
      option = gets.chomp.to_i
      if option == 10
        puts 'thank you for using our app!'
        break if option == 10
      end
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
      Collections.save_data('music_albums', @music_albums) unless @music_albums.empty?
      Collections.save_data('genres', @genres) unless @genres.empty?
    when 9
      add_game
      Collections.save_data('games', @games) unless @games.empty?
      Collections.save_data('authors', @authors) unless @authors.empty?
    else
      puts 'Invalid option! Please choose a valid option.'
    end
  end
end

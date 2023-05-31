require_relative '../classes/game'
require_relative '../classes/label'
require_relative '../classes/author'
require_relative './utils'

module GameLister
  include Utils
  def list_games
    if @games.empty?
      puts 'No games available'
    else
      puts 'List of games:'
      @games.each_with_index do |game, index|
        print "#{index + 1}. published on #{game.publish_date}"
        puts " and is #{game.multiplayer ? 'multiplayer' : 'singleplayer'} last played on #{game.last_played_at}"
      end
    end
    puts "\n"
  end

  def add_game
    puts 'Please enter the publish date of the book YYYY-MM-DD:   '
    publish_date = input_date
    print 'multiplayer status (Y/N):  '
    multiplayer = gets.chomp.downcase
    multiplayer = check_boolean?(multiplayer)
    puts 'Last played date YYYY-MM-DD:   '
    last_played_at = input_date
    print "Author's First name: "
    first_name = gets.chomp
    print "Author's Last name: "
    last_name = gets.chomp
    game = Game.new(publish_date, multiplayer, last_played_at)
    author = Author.new(first_name, last_name)
    author.add_item(game)
    @games << game
    puts 'Game created successfully'
  end
end

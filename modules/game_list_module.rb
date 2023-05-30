require_relative '../classes/game'
require_relative '../classes/label'
require_relative '../classes/author'

module GameLister
    @@games = []
    @@authors = []

  def list_games
    if @@games.empty?
      puts 'No games available'
    else
      puts 'List of games:'
      @@games.each_with_index do |game, index|
        print "#{index + 1}. #{game.title} "
        puts "published on #{game.publish_date} and is #{game.multiplayer ? 'multiplayer' : 'singleplayer'}"
      end
    end
    puts "\n"
  end

  def add_game
    print 'Please enter the publish date of the book YYYY-MM-DD:   '
    publish_date = gets.chomp
    print 'multiplayer status true or false:  '
    multiplayer = gets.chomp
    print 'Last played date YYYY-MM-DD:   '
    last_played_at = gets.chomp
    print "Author's First name: "
    first_name = gets.chomp
    print "Author's Last name: "
    last_name = gets.chomp
    author = Author.new(first_name, last_name)
    @authors << author
    game = Game.new(publish_date, multiplayer, last_played_at, author)
    @games << game
    puts 'Game created successfully'
  end
  
end

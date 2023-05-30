require_relative '../classes/genre'

module GenreModule

  def select_genre
    puts 'Select a genre from the list:'
    list_genres
    option = gets.chomp.to_i
    until option.between?(1, @genres.length)
      puts 'Invalid option! Please choose a valid option.'
      option = gets.chomp.to_i
    end
    @genres[option - 1]
  end

  def list_genres
    if @genres.empty?
      puts 'No genres available yet. Please create a genre first.'
    else
      puts 'List of all genres:'
      @genres.each_with_index do |genre, index|
        puts "#{index + 1}. #{genre.name}"
      end
    end
    puts "\n"
  end

  def create_genre
    puts 'Enter the genre name:'
    name = gets.chomp
    genre = Genre.new(name)
    @genres << genre
    genre
   end

  def add_genre
    if @genres.empty?
      puts 'No genres available. Please create a genre first.'
      create_genre
    else
      puts 'Select a genre for this album music or create a new one :'
      puts '1. Create a new genre'
      puts '2. Select a genre from the list'

      option = gets.chomp.to_i
      case option
      when 1
        create_genre
      when 2
        select_genre
      else
        puts 'Invalid option! Please choose a valid option.'
      end
    end
  end
end

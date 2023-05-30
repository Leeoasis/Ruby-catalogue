require 'json'
require_relative '../classes/book'


module BooksUi
    def initialize
        @book_file = 'data/books.json'
        @books = JSON.parse(File.read(@book_file)) || []
    end

    def add_book
      puts 'Title:'
      title = gets.chomp
      puts 'Publisher:'
      publisher = gets.chomp
      puts 'Publish date:'
      publish_date = gets.chomp
      puts 'Cover State:'
      cover_state = gets.chomp
        book = Book.new(title, publisher, publish_date, cover_state)
        @books << book.to_h
        
        File.write(@book_file, JSON.generate(@books))
        @books = JSON.parse(File.read(@book_file))
        puts "Book created successfuly!\n\n"
        puts "Please choose an option by entering a number!\n"
    end

    def list_books
      if @books.empty?
        puts 'There are no books.'
        puts "Please choose an option by entering a number!\n"
        return
      end
      @books.each do |book|
        puts "Title: #{book['title']}, Publisher: #{book['publisher']}, Publish date: #{book['publish_date']}, Cover state: #{book['cover_state']} \n\n"
      end
    end
    
   
end


require 'json'
require_relative '../classes/book'
require_relative '../classes/label'

module BooksUi
  def initialize
    @book_file = 'data/books.json'
    @labels_file = 'data/labels.json'
    @books = JSON.parse(File.read(@book_file)) || []
    @labels = JSON.parse(File.read(@labels_file)) || []
  end

  def prompt_data(text)
    puts text
    gets.chomp
  end

  def add_book
    publisher = prompt_data('Publisher Name: ')
    cover_state = prompt_data('Choose cover state(good/normal/bad): ')
    publish_date = prompt_data('Published Date(YYYY/MM/DD): ')
    book = Book.new(publisher, publish_date, cover_state)
    add_label(book)
    @books << book.to_h

    File.write(@book_file, JSON.generate(@books))
    @books = JSON.parse(File.read(@book_file))
    puts "Book created successfuly!\n\n"
    puts "Please choose an option by entering a number!\n\n"
  end

  def list_books
    if @books.empty?
      puts 'There are no books.'
      puts "Please choose an option by entering a number!\n\n"
      return
    end
    @books.each do |book|
      puts "Title: #{book['title']}, Publisher: #{book['publisher']}, Publish date: #{book['publish_date']}, Cover state: #{book['cover_state']}, Color: #{book['label_color']}"
      puts "Please choose an option by entering a number!\n\n"
    end
  end
end

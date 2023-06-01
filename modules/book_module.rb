require 'json'
require_relative '../classes/book'
require_relative '../classes/label'
require_relative './utils'

module BooksUi
include Utils

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
    puts 'add the publish date (yyyy-mm-dd) :'
    publish_date = input_date
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
    end
    puts "Please choose an option by entering a number!\n\n"
  end

  def add_label(item)
    title = prompt_data('Add Title: ')
    color = prompt_data('Choose Color: ')

    label = Label.new(title, color)
    label.add_item(item) # Add the item (book) to the label

    # Add the label to the labels array
    @labels << label.to_hash

    # Save the updated labels array to the JSON file
    File.write(@labels_file, JSON.generate(@labels))
    @labels = JSON.parse(File.read(@labels_file))
  end

  def list_label
    if @labels.empty?
      puts 'There are no labels.'
      puts "Please choose an option by entering a number!\n\n"
      return
    end
    @labels.each do |label|
      puts "Title: #{label['title']}, Color: #{label['color']}"
    end
    puts "Please choose an option by entering a number!\n\n"
  end
end

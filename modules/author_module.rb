require_relative '../classes/author'

module Authorlist
  def list_authors
    if @authors.empty?
      puts 'There are no authors in the library'
      return
    end
    puts 'List of authors:'
    @authors.each do |author|
      puts "First name: #{author.first_name} - Last name: #{author.last_name}"
    end
    puts "\n"
  end
end

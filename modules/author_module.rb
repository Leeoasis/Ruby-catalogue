require_relative '../classes/author'

module Authorlist
    def list_authors
      if @authors.empty?
        puts 'There are no authors in the library'
        return
      end
  
      @authors.each do |author|
        puts "First name: #{author.first_name}"
        puts "Last name: #{author.last_name}"
        puts "\n"
      end
    end
  end
  
  
require_relative './classes/app'

def main
  app = App.new
  puts 'Welcome to our Catalogue App!'
  app.run
end

main

require_relative './modules/display_menu_options'

class App
   include DisplayMenuOptions

    def initialize
        @books = []
        @music_albums = []
        @games = []
    end

    def run
        loop do
            display_menu_options
            option = gets.chomp.to_i
            puts '\n'
            break if option == 10
            handle_option(option)
        end
    end 
end
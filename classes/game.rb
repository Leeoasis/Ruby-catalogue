require 'date'
require_relative 'item'

class Game < Item
  def initialize(publish_date, archived, multiplayer, last_played_at)
    super(publish_date, archived)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    super && @last_played_at < (Date.today - (2 * 365))
  end
end

game = Game.new(Date.new(2010, 1, 1), false, false, Date.new(2022, 1, 1))
puts game.can_be_archived?

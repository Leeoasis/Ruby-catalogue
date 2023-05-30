require 'date'
require_relative 'item'

class Game < Item
  def initialize(publish_date,multiplayer, last_played_at)
    super(publish_date, archived)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    super && @last_played_at < (Date.today - (2 * 365))
  end
end


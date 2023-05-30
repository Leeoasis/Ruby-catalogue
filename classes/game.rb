require 'date'
require_relative 'item'
require_relative 'author'

class Game < Item
  attr_accessor :multiplayer, :last_played_at, :author

  def initialize(publish_date, multiplayer, last_played_at, author)
    super(publish_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
    add_author(author)
  end

  def can_be_archived?
    super && @last_played_at < (Date.today - (2 * 365))
  end

  private

  def add_author(author)
    @author = author
  end
end

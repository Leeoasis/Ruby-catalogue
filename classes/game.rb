require 'date'
require_relative 'item'
require_relative 'author'

class Game < Item
  attr_accessor :multiplayer, :last_played_at, :author

  def initialize(publish_date, multiplayer, last_played_at)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
    super(publish_date)
  end

  def can_be_archived?
    @last_played_at = Date.parse(@last_played_at) unless @last_played_at.is_a?(Date)
    super && @last_played_at < (Date.today - (2 * 365))
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'publish_date' => @publish_date,
      'multiplayer' => @multiplayer,
      'last_played_at' => @last_played_at,
      'author' => @author
    }.to_json(*args)
  end

  def self.json_create(object)
    game = new(object['publish_date'], object['multiplayer'], object['last_played_at'])
    author = JSON.parse(JSON.generate(object['author']), create_additions: true)
    author.add_item(game)
    game
  end
end

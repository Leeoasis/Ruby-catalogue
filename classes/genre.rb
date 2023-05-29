require_relative 'item'

class Genre
  attr_accessor :name, :items
  attr_reader :id

  def initialize(name)
    @id = rand(1..1000)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.genre = self
  end
end

genre = Genre.new('Action')
puts genre.name
puts genre.id
item = Item.new(Date.new(2020, 1, 1), false)
genre.add_item(item)
puts genre.items
puts item.genre.name

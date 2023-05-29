require_relative 'item'

class Label
  attr_accessor :title, :color, :items
  attr_reader :id

  def initialize(title, color)
    @id = rand(1..1000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
    item.label = self
  end

  def to_json(*args)
    {
      'id' => @id,
      'title' => @title,
      'color' => @color,
      'items' => @items
    }.to_json(*args)
  end
end

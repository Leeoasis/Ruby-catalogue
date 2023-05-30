require_relative 'item'

class Label
  attr_accessor :title, :items
  attr_reader :id

  def initialize(title)
    @id = rand(1..1000)
    @title = title
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
      'items' => @items
    }.to_json(*args)
  end
end

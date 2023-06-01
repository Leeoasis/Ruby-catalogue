require_relative 'item'

class Label
  attr_accessor :title, :color, :items, :id

  def initialize(title, color)
    @id = Random.rand(1..1000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    return if @items.include?(item)

    @items << item
    item.label = self
    item.title = @title
    item.label_color = @color
  end

  def to_hash
    {
      id: @id,
      title: title,
      color: color
    }
  end
end

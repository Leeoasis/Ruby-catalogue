require_relative 'item'

class Label
  attr_accessor :title, :color

  def initialize(title, color)
    @id = Random.rand(1..1000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item unless @items.include?(item)
    item.label = self # Set the label of the item to the current label object
    item.title = @title # Set the title of the item to the title of the label
    item.label_color = @color # Set the label color of the item to the color of the label
  end

  def to_hash
    {
      id: @id,
      title: title,
      color: color
    }
  end
end

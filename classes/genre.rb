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

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'name' => @name
    }.to_json(*args)
  end

  def self.json_create(object)
    new(object['name'])
  end
end

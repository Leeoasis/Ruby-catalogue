require_relative '../classes/genre'
require_relative '../classes/item'

describe Genre do
  before :each do
    @genre = Genre.new('Action')
  end
  it 'takes one parameter and returns a Genre object' do
    expect(@genre).to be_an_instance_of Genre
  end

  it 'add item to items array' do
    item = Item.new(Date.new(2020, 1, 1))
    @genre.add_item(item)
    expect(@genre.items).to include(item)
  end
end

require 'rspec'
require 'json'
require_relative '../classes/author'

RSpec.describe Author do
  let(:author) { Author.new('John', 'Doe') }
  let(:item) { double('Item') }

  describe '#first_name' do
    it 'returns the correct first name' do
      expect(author.first_name).to eq('John')
    end
  end

  describe '#last_name' do
    it 'returns the correct last name' do
      expect(author.last_name).to eq('Doe')
    end
  end

  describe '#id' do
    it 'returns an ID between 1 and 1000' do
      expect(author.id).to be_between(1, 1000).inclusive
    end
  end

  describe '#items' do
    it 'returns an array containing the added item' do
      allow(item).to receive(:author=)
      author.add_item(item)
      expect(author.items).to contain_exactly(item)
    end
  end

  describe '#to_json' do
    it 'serializes the author object to JSON' do
      json_data = author.to_json
      deserialized_author = JSON.parse(json_data, create_additions: true)
      expect(deserialized_author).to be_a(Author)
    end
  end
end

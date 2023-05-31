require_relative '../classes/label'

RSpec.describe Label do
  let(:title) { 'Test Label' }
  let(:color) { 'red' }
  let(:label) { Label.new(title, color) }

  describe '#add_item' do
    it 'adds an item to the label' do
      item = double('item')
      expect(item).to receive(:label=).with(label)
      expect(item).to receive(:title=).with(title)
      expect(item).to receive(:label_color=).with(color)

      label.add_item(item)

      expect(label.items).to eq([item])
    end

    it 'adds multiple unique items to the label' do
      item1 = double('item1')
      item2 = double('item2')
      item3 = double('item3')

      expect(item1).to receive(:label=).with(label)
      expect(item1).to receive(:title=).with(title)
      expect(item1).to receive(:label_color=).with(color)

      expect(item2).to receive(:label=).with(label)
      expect(item2).to receive(:title=).with(title)
      expect(item2).to receive(:label_color=).with(color)

      expect(item3).to receive(:label=).with(label)
      expect(item3).to receive(:title=).with(title)
      expect(item3).to receive(:label_color=).with(color)

      label.add_item(item1)
      label.add_item(item2)
      label.add_item(item3)

      expect(label.items).to contain_exactly(item1, item2, item3)
    end
  end

  describe '#to_hash' do
    it 'returns the label attributes as a hash' do
      expected_hash = {
        id: label.id,
        title: title,
        color: color
      }
      expect(label.to_hash).to eq(expected_hash)
    end
  end
end

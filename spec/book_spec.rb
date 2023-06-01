require_relative '../classes/book'

RSpec.describe Book do
  let(:publisher) { 'Sample Publisher' }
  let(:publish_date) { Date.new(2021, 1, 1) }
  let(:cover_state) { 'good' }
  let(:book) { Book.new(publisher, publish_date, cover_state) }

  describe '#initialize' do
    it 'sets the publisher, publish_date, and cover_state' do
      expect(book.publisher).to eq(publisher)
      expect(book.publish_date).to eq(publish_date)
      expect(book.cover_state).to eq(cover_state)
    end

    it 'generates a random id between 1 and 1000' do
      expect(book.id).to be_between(1, 1000).inclusive
    end

    it 'sets archived to false' do
      expect(book.archived).to be_falsey
    end
  end

  describe '#to_h' do
    it 'returns the book attributes as a hash' do
      expected_hash = {
        title: nil,
        publisher: publisher,
        publish_date: publish_date,
        cover_state: cover_state,
        label_color: nil
      }
      expect(book.to_h).to eq(expected_hash)
    end
  end

  describe '#can_be_archived?' do
    context 'when the cover state is good' do
      it 'returns false' do
        expect(book.send(:can_be_archived?)).to be_falsey
      end
    end

    context 'when the cover state is bad and publish date is before 2022-01-01' do
      let(:cover_state) { 'bad' }
      let(:publish_date) { Date.new(2020, 12, 31) }

      it 'returns true' do
        expect(book.send(:can_be_archived?)).to be_truthy
      end
    end

    context 'when the cover state is bad but publish date is on or after 2022-01-01' do
      let(:cover_state) { 'bad' }
      let(:publish_date) { Date.new(2022, 1, 1) }

      it 'returns false' do
        expect(book.send(:can_be_archived?)).to be_falsey
      end
    end

    context 'when the cover state is not good or bad' do
      let(:cover_state) { 'average' }

      it 'returns false' do
        expect(book.send(:can_be_archived?)).to be_falsey
      end
    end
  end
end

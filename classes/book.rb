require_relative 'item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(title, publisher, publish_date, cover_state)
    super(publish_date)
    @title = title
    @publisher = publisher
    @cover_state = cover_state
  end

  def to_h
    {
      title: @title,
      publisher: @publisher,
      publish_date: @publish_date,
      cover_state: @cover_state
    }
  end

  private

  def can_be_archived?
    super || (@cover_state == 'bad' && @publish_date.strftime('%Y-%m-%d') < '2022-01-01')
  end
end

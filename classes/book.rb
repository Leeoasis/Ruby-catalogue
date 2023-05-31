require_relative 'item'

class Book < Item
  attr_accessor :publisher, :cover_state, :title, :label_color

  def initialize(publisher, publish_date, cover_state)
    super(publish_date)
    @id = Random.rand(1..1000)
    @publisher = publisher
    @cover_state = cover_state
  end

  def to_h
    {
      title: @title,
      publisher: @publisher,
      publish_date: @publish_date,
      cover_state: @cover_state,
      label_color: @label_color
    }
  end

  private

  def can_be_archived?
    super || (@cover_state == 'bad' && @publish_date.strftime('%Y-%m-%d') < '2022-01-01')
  end
end

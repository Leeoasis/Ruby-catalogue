require_relative 'item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(title, publisher, publish_date, cover_state)
    super(publish_date)
    @title = title
    @publisher = publisher
    @cover_state = cover_state
  

  def to_json(*args)
    {
      'id' => @id,
      'title' => @title,
      'author' => @author&.to_json,
      'publisher' => @publisher,
      'label' => @label,
      'archived' => @archived,
      'publish_date' => @publish_date,
      'cover_state' => @cover_state
    }.to_json(*args)
  end

  private

  def can_be_archived?
    super || @cover_state == 'bad'
  end
end

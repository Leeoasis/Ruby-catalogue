require_relative 'item'

class Book < Item
  attr_accessor :title, :author, :publisher, :label, :cover_state

  def initialize(title, author, publisher, publish_date)
    super(publish_date, false)
    @title = title
    @author = author
    @publisher = publisher
    @label = nil
    @cover_state = 'bad'
  end

  def can_be_archived?
    super() || @cover_state == 'bad'
  end

  def to_json(*args)
    {
      'id' => @id,
      'title' => @title,
      'author' => @author,
      'publisher' => @publisher,
      'label' => @label,
      'archived' => @archived,
      'publish_date' => @publish_date,
      'cover_state' => @cover_state
    }.to_json(*args)
  end
end

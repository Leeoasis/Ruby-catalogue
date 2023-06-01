require 'date'

class Item
  attr_accessor :genre, :author, :label, :archived
  attr_reader :id, :publish_date

  def initialize(publish_date)
    @id = rand(1..1000)
    @publish_date = publish_date
    @archived = can_be_archived?
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  def add_genre(genre)
    @genre = genre
    genre.add_item(self) unless genre.items.include?(self)
  end

  def add_author(author)
    @author = author
    author.add_item(self) unless author.items.include?(self)
  end

  def add_label(label)
    @label = label
    label.add_item(self) unless label.items.include?(self)
  end

  private

  def can_be_archived?
    @publish_date = Date.parse(@publish_date) unless @publish_date.is_a?(Date)
    today = Date.today
    ten_years_ago = (today - (10 * 365))
    @publish_date < ten_years_ago
  end
end

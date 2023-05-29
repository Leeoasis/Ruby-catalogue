require 'date'

class Item
  def initialize(genre, author, label, publish_date, archived)
    @genre = genre
    @author = author
    @label = label
    @publish_date = publish_date
    @archived = archived
  end

  def can_be_archived?
    today = Date.today
    ten_years_ago = (today - (10 * 365))
    @publish_date < ten_years_ago
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end
end


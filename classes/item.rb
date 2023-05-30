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

  private

  def can_be_archived?
    today = Date.today
    ten_years_ago = (today - (10 * 365))
    @publish_date < ten_years_ago
  end
end

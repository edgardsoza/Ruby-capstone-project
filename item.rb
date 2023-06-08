require 'date'

class Item
  attr_accessor :publish_date, :genre, :label
  attr_reader :id, :archived, :author

  def initialize(publish_date, archived, id = nil)
    @id = id || rand(1..1000)
    @publish_date = publish_date
    @archived = archived
  end

  def add_genre=(genre)
    @genre = genre
    genre.add_item(self)
  end

  def move_to_archive
    @archived = can_be_archived
  end

  def can_be_archived?
    Date.today.year - Date.parse(publish_date).year >= 10
  end
end

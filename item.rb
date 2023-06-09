require 'date'

# Item class
class Item
  attr_accessor :publish_date, :genre, :label
  attr_reader :id, :archived, :author

  def initialize(publish_date, archived, id = nil)
    @id = id || rand(1..1000)
    @publish_date = publish_date
    @archived = archived
    @genre = genre
    @author = author
    @source = source
    @label = label
  end

  def add_genre=(genre)
    @genre = genre
    genre.add_item(self)
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  def can_be_archived?
    Date.today.year - Date.parse(publish_date).year >= 10
  end
  private :can_be_archived?
end

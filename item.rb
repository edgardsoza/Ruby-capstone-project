require 'date'

class Item
  attr_accessor :genre, :author, :label, :publish_date
  attr_reader :id, :archived

  def initialize(publish_date)
    @publish_date = publish_date
    @id = id
    @archived = false
  end

  def add_genre(genre)
    genre.items << self unless genre.items.include?(self)
    @genre = genre
  end

  def move_to_archive
    @archived = can_be_archived? ? true : false
  end

  def can_be_archived?
    Date.today.year - Date.parse(publish_date).year >= 10
  end
end

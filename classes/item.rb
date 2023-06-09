require 'date'

# Item class
class Item
  attr_accessor :publish_date, :label, :author
  attr_reader :id, :archived, :genre

  def initialize(publish_date)
    @id = id || rand(1..1000)
    @publish_date = publish_date
    @archived = false
  end

  def genre=(genre)
    @genre = genre
    genre.items.push(self) unless genre.items.include?(self)
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  def can_be_archived?
    Date.today.year - Date.parse(publish_date).year >= 10
  end

  def self.from_hash(hash)
    new(
      hash['id'],
      hash['title']
    )
  end
  private :can_be_archived?
end

require_relative 'item'

# This code construct implements the Book class
class Book < Item
  attr_accessor :cover_state, :publisher

  def initialize(publish_date, cover_state, publisher)
    super(publish_date)
    @cover_state = cover_state
    @publisher = publisher
  end

  def can_be_archived?
    super || @cover_state == 'bad'
  end

  def to_hash
    {
      'id' => id,
      'title' => title,
      'author' => author,
      'genre' => genre,
      'source' => source,
      'publish_date' => publish_date,
      'publisher' => publisher,
      'cover_state' => cover_state
    }
  end

  def self.from_hash(hash)
    new(
      hash['id'],
      hash['title'],
      hash['author'],
      hash['genre'],
      hash['source'],
      hash['publish_date'],
      hash['publisher'],
      hash['cover_state']
    )
  end
end

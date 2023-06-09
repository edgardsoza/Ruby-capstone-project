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
      'publish_date' => publish_date,
      'publisher' => publisher,
      'cover_state' => cover_state
    }
  end

  def self.from_hash(hash)
    new(
      hash['publish_date'],
      hash['publisher'],
      hash['cover_state']
    )
  end
end

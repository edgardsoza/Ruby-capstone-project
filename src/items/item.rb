require 'date'

# item class
class Item
  attr_accessor :genre, :author, :label, :publish_date
  attr_reader :id, :title, :source, :publisher, :cover_state

  # rubocop:disable Metrics/ParameterLists
  def initialize(id, title, author, genre, source, publish_date, publisher, cover_state)
    @id = id
    @title = title
    @author = author
    @genre = genre
    @source = source
    @publish_date = publish_date
    @publisher = publisher
    @cover_state = cover_state
  end

  # rubocop:enable Metrics/ParameterLists

  def can_be_archived?
    Date.today.year - Date.parse(@publish_date).year > 10
  end

  def move_to_archive
    @archived = can_be_archived?
  end

  def self.from_hash(hash)
    new(
      hash['id'],
      hash['title']
    )
  end
end

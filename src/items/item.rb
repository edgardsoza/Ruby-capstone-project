# frozen_string_literal: true

# item class
class Item
  attr_accessor :genre, :author, :label, :publish_date
  attr_reader :id, :archived

  # rubocop:disable Metrics/ParameterLists
  def initialize(id, title, author, genre, source, publish_date)
    @id = id
    @title = title
    @author = author
    @genre = genre
    @source = source
    @publish_date = publish_date
  end
  # rubocop:enable Metrics/ParameterLists

  def can_be_archived?
    @publish_date > 10.years.ago
  end

  def move_to_archive
    @archived = can_be_archived? ? true : false
  end
end

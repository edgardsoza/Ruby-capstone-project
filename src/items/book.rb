# frozen_string_literal: true

require_relative './item'

# This code construct implements the Book class
class Book < Item
  attr_accessor :author, :genre, :source, :publish_date, :publisher, :cover_state

  def initialize(id, title, author, genre, source, publish_date, publisher, cover_state)
    super(id, title)
    @author = author
    @genre = genre
    @source = source
    @publish_date = publish_date
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    super || @cover_state == 'bad'
  end
end

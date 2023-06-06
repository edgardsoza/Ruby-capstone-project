# frozen_string_literal: true

class Item
  attr_accessor :id, :genre, :author, :source, :label, :publish_date, :archived

  def initialize(id, genre, author, source, label, publish_date)
    @id = id
    @genre = genre
    @author = author
    @source = source
    @label = label
    @publish_date = publish_date
    @archived = false
  end

  def can_be_archived?
    (Time.now - @publish_date) > (10 * 365 * 24 * 60 * 60)
  end

  def move_to_archive
    return unless can_be_archived?

    @archived = true
  end
end

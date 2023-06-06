# frozen_string_literal: true

class Item
  attr_accessor :id, :name, :archived, :genre, :author, :source, :label, :publish_date

  def initialize(name, publish_date, id = Random.rand(1..10_000))
    @publish_date = publish_date
    @id = id
    @name = name
    @archived = false
  end

  def add_genre(id)
    @genre = id
  end

  def can_be_archived?
    @publish_date > 10.years.ago
  end

  def move_to_archive
    @archived = can_be_archived? ? true : false
  end
end

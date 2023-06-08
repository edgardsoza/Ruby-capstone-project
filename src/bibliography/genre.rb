# frozen_string_literal: true

# Define Genre class
class Genre
  attr_reader :id, :name

  def initialize(id, name)
    @id = id
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.genre = self
  end
end

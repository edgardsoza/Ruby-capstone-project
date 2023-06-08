# frozen_string_literal: true

# This class represents a label associated with items.
class Label
  attr_reader :id, :title, :color

  def initialize(id, title, color)
    @id = id
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
    item.label = self
  end

  def to_hash
    {
      'id' => id,
      'title' => title,
      'color' => color
    }
  end

  def self.from_hash(hash)
    id = hash['id']
    title = hash['title']
    color = hash['color']
    Label.new(id, title, color)
  end
end

# frozen_string_literal: true

# This implements the source class
class Source
  attr_reader :id, :name

  def initialize(id, name)
    @id = id
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.source = self
  end
end

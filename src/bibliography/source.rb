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

  def to_hash
    {
      'id' => id,
      'name' => name
    }
  end

  def self.from_hash(hash)
    id = hash['id']
    name = hash['name']
    Source.new(id, name)
  end
end

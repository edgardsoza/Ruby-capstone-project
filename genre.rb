require_relative 'item'

class Genre
  attr_accessor :id, :name, :items

  def initialize(name, id = Random.rand(1..10_000))
    @id = id
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item.id
  end
end

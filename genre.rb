require_relative 'item'

class Genre
  attr_accessor :id, :name, :items

  def initialize(name, id = nil)
    @id = id
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.genre = self
  end
end

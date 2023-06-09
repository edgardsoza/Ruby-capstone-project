# Genre class
class Genre
  attr_accessor :name, :items, :id

  def initialize(name, id = nil)
    @id = id || rand(1..1000)
    @name = name
    @items = []
  end

  def add_item(item)
    item.genre = self unless item.genre == self
    @items << item
  end
end

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

  def to_hash
    {
      'id' => id,
      'name' => name
    }
  end

  def self.from_hash(hash)
    return nil unless hash

    id = hash['id']
    name = hash['name']
    Source.new(id, name)
  end
end

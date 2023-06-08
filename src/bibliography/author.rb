# Define Author class
class Author
  attr_reader :id, :first_name, :last_name

  def initialize(id, first_name, last_name)
    @id = id
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    @items << item
    item.author = self
  end

  def to_hash
    {
      'id' => id,
      'first_name' => first_name,
      'last_name' => last_name
    }
  end

  def self.from_hash(hash)
    id = hash['id']
    first_name = hash['first_name']
    last_name = hash['last_name']
    Author.new(id, first_name, last_name)
  end
end

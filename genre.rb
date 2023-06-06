require_relative 'item'

class Genre
    def initialize(id, name, items=[])
        @id = id
        @name = name
        @items = items
    end
    add_item(item)
    
    end
end
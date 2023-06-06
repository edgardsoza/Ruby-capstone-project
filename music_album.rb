require_relative 'item'

class MusicAlbum < Item
attr_accessor :on_spotify, :genre
def initialize(on_spotify, name, publish_date, id = Random.rand(1..10_000) )
    super(name, publish_date, id)
    @genre = genre
    @on_spotify = on_spotify
end

def add_genre(id, genres)
    @genre = genres.find { |genre| genre.id == id }
    @genre.add_item(self)
end
 
end

def can_be_archived?
 super && @on_spotify
end
end
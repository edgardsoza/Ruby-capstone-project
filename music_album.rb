require_relative 'item'

class MusicAlbum < Item
def initialize(on_spotify)
    @on_spotify = on_spotify
end

def can_be_archived?
 super && @on_spotify == true
end
end
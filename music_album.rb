require_relative 'item'

# Music Album class
class MusicAlbum < Item
  attr_reader :on_spotify

  def initialize(publish_date, on_spotify)
    @on_spotify = on_spotify
    super(publish_date)
  end

  def can_be_archived?
    super && @on_spotify
  end
  private :can_be_archived?
end

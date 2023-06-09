require_relative 'item'

# Music Album class
class MusicAlbum < Item
  attr_accessor :genre, :author, :source, :label, :archived
  attr_reader :id, :publish_date, :on_spotify

  def initialize(id, publish_date, on_spotify)
    @on_spotify = on_spotify
    super(publish_date, id)
  end

  def can_be_archived?
    super && @on_spotify
  end
  private :can_be_archived?
end

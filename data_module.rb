require 'json'

# Data Module
module DataModule
  def album_to_hash(album)
    {
      id: album.id,
      publish_date: album.publish_date,
      on_spotify: album.on_spotify
    }
  end

  def genre_to_hash(genre)
    {
      id: genre.id,
      name: genre.name
    }
  end

  def store_music_albums
    File.write('./data/albums.json', @music_albums.map { |album| album_to_hash(album) }.to_json)
  end

  def store_genres
    File.write('./data/genres.json', @genres.map { |genre| genre_to_hash(genre) }.to_json)
  end

  def load_music_albums
    data = []
    if File.exist?('./data/albums.json') && !File.empty?('./data/albums.json')
      JSON.parse(File.read('./data/albums.json')).each do |album|
        data.push(MusicAlbum.new(album['id'], album['publish_date'], album['on_spotify']))
      end
    end
    data
  end

  def load_genres
    data = []
    if File.exist?('./data/genres.json') && !File.empty?('./data/genres.json')
      JSON.parse(File.read('./data/genres.json')).each do |genre|
        data.push(Genre.new(genre['name'], genre['id']))
      end
    end
    data
  end
end

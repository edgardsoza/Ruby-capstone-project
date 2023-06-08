require 'json'
require_relative './src/genre'
require_relative './src/source'
require_relative './src/author'
require_relative './src/items/item'
require_relative './src/items/label'
require_relative './src/items/book'
require_relative './src/items/music_album'
require_relative './src/items/movie'
require_relative './src/items/game'

# Load data from JSON files
def load_data
  genres_data = JSON.parse(File.read('genres.json'))
  authors_data = JSON.parse(File.read('authors.json'))
  sources_data = JSON.parse(File.read('sources.json'))
  labels_data = JSON.parse(File.read('labels.json'))
  books_data = JSON.parse(File.read('books.json'))
  music_albums_data = JSON.parse(File.read('music_albums.json'))
  movies_data = JSON.parse(File.read('movies.json'))
  games_data = JSON.parse(File.read('games.json'))

  genres = genres_data.map { |data| Genre.new(data['id'], data['name']) }
  authors = authors_data.map { |data| Author.new(data['id'], data['first_name'], data['last_name']) }
  sources = sources_data.map { |data| Source.new(data['id'], data['name']) }
  labels = labels_data.map { |data| Label.new(data['id'], data['title'], data['color']) }

  books = books_data.map do |data|
    genre = genres.find { |g| g.id == data['genre_id'] }
    author = authors.find { |a| a.id == data['author_id'] }
    label = labels.find { |l| l.id == data['label_id'] }
    Book.new(data['id'], genre, author, nil, label, Time.parse(data['publish_date']), data['archived'], data['publisher'], data['cover_state'])
  end

  music_albums = music_albums_data.map do |data|
    genre = genres.find { |g| g.id == data['genre_id'] }
    author = authors.find { |a| a.id == data['author_id'] }
    label = labels.find { |l| l.id == data['label_id'] }
    MusicAlbum.new(data['id'], genre, author, nil, label, Time.parse(data['publish_date']), data['archived'], data['on_spotify'])
  end

  movies = movies_data.map do |data|
    genre = genres.find { |g| g.id == data['genre_id'] }
    author = authors.find { |a| a.id == data['author_id'] }
    label = labels.find { |l| l.id == data['label_id'] }
    Movie.new(data['id'], genre, author, nil, label, Time.parse(data['publish_date']), data['archived'], data['silent'])
  end

  games = games_data.map do |data|
    genre = genres.find { |g| g.id == data['genre_id'] }
    author = authors.find { |a| a.id == data['author_id'] }
    label = labels.find { |l| l.id == data['label_id'] }
    Game.new(data['id'], genre, author, nil, label, Time.parse(data['publish_date']), data['archived'], data['multiplayer'], Time.parse(data['last_played_at']))
  end

  [genres, authors, sources, labels, books, music_albums, movies, games]
end

# Save data to JSON files
def save_data(data)
  genres, authors, sources, labels, books, music_albums, movies, games = data

  File.write('genres.json', JSON.generate(genres.map { |g| { 'id' =>

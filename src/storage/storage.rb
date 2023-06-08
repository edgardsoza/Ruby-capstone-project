require_relative '../items/book'
require_relative '../items/music_album'
require_relative '../items/movie'
require_relative '../items/game'
require_relative '../bibliography/genre'
require_relative '../bibliography/label'
require_relative '../bibliography/author'
require_relative '../bibliography/source'

class Storage
  attr_reader :genres, :labels, :authors, :sources

  def initialize
    @genres = []
    @labels = []
    @authors = []
    @sources = []
  end

  def add_item(item)
    case item
    when Book
      add_book(item)
    when MusicAlbum
      add_music_album(item)
    when Movie
      add_movie(item)
    when Game
      add_game(item)
    end
  end

  def save_data_to_files
    save_to_file('genres.txt', @genres)
    save_to_file('labels.txt', @labels)
    save_to_file('authors.txt', @authors)
    save_to_file('sources.txt', @sources)
  end

  private

  def add_book(book)
    genre = find_or_create_genre(book.genre)
    genre.items << book

    author = find_or_create_author(book.author)
    author.items << book
  end

  def add_music_album(album)
    genre = find_or_create_genre(album.genre)
    genre.items << album

    label = find_or_create_label(album.label)
    label.items << album
  end

  def add_movie(movie)
    genre = find_or_create_genre(movie.genre)
    genre.items << movie

    source = find_or_create_source(movie.source)
    source.items << movie
  end

  def add_game(game)
    genre = find_or_create_genre(game.genre)
    genre.items << game

    source = find_or_create_source(game.source)
    source.items << game
  end

  def find_or_create_genre(name)
    genre = @genres.find { |g| g.name == name }
    if genre.nil?
      genre = Genre.new(name)
      @genres << genre
    end
    genre
  end

  def find_or_create_label(title)
    label = @labels.find { |l| l.title == title }
    if label.nil?
      label = Label.new(title)
      @labels << label
    end
    label
  end

  def find_or_create_author(name)
    author = @authors.find { |a| a.name == name }
    if author.nil?
      author = Author.new(name)
      @authors << author
    end
    author
  end

  def find_or_create_source(title)
    source = @sources.find { |s| s.title == title }
    if source.nil?
      source = Source.new(title)
      @sources << source
    end
    source
  end

  def save_to_file(filename, items)
    File.open(filename, 'w') do |file|
      items.each do |item|
        file.puts(item.to_s)
      end
    end
  end
end

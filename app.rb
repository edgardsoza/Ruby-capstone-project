# frozen_string_literal: true

require_relative './src/storage/storage'

require_relative './src/bibliography/author'
require_relative './src/bibliography/genre'
require_relative './src/bibliography/label'
require_relative './src/bibliography/source'

require_relative './src/items/item'
require_relative './src/items/book'

# This implements the App Module
module App
  def self.list_all_books
    books = Storage.load_data('books') || []
    puts 'Listing all books:'
    books.each do |book_data|
      book = Book.from_hash(book_data)
      puts "ID: #{book.id}, Title: #{book.title}, Author: #{book.author}, Published Date: #{book.publish_date}, Publisher: #{book.publisher}, Cover State: #{book.cover_state}"
    end
  end

  def self.list_all_music_albums
    music_albums = Storage.load_data('music_albums') || []
    puts 'Listing all music albums:'
    music_albums.each do |music_album_data|
      puts "ID: #{music_album_data['id']}, Title: #{music_album_data['title']}, Artist: #{music_album_data['artist']}, Published Date: #{music_album_data['publish_date']}"
    end
  end

  def self.list_all_movies
    movies = Storage.load_data('movies') || []
    puts 'Listing all movies:'
    movies.each do |movie_data|
      puts "ID: #{movie_data['id']}, Title: #{movie_data['title']}, Silent: #{movie_data['silent']}, Published Date: #{movie_data['publish_date']}"
    end
  end

  def self.list_all_games
    games = Storage.load_data('games') || []
    puts 'Listing all games:'
    games.each do |game_data|
      puts "ID: #{game_data['id']}, Title: #{game_data['title']}, Multiplayer: #{game_data['multiplayer']}, Published Date: #{game_data['publish_date']}"
    end
  end

  def self.list_all_genres
    genres = Storage.load_data('genres') || []
    puts 'Listing all genres:'
    genres.each do |genre_data|
      puts "ID: #{genre_data['id']}, Name: #{genre_data['name']}"
    end
  end

  def self.list_all_labels
    labels = Storage.load_data('labels') || []
    puts 'Listing all labels:'
    labels.each do |label_data|
      puts "ID: #{label_data['id']}, Title: #{label_data['title']}, Color: #{label_data['color']}"
    end
  end

  def self.list_all_authors
    authors = Storage.load_data('authors') || []
    puts 'Listing all authors:'
    authors.each do |author_data|
      puts "ID: #{author_data['id']}, First Name: #{author_data['first_name']}, Last Name: #{author_data['last_name']}"
    end
  end

  def self.list_all_sources
    sources = Storage.load_data('sources') || []
    puts 'Listing all sources:'
    sources.each do |source_data|
      puts "ID: #{source_data['id']}, Name: #{source_data['name']}"
    end
  end

  def self.add_book
    puts 'Adding a book:'
    puts 'Enter the title:'
    title = gets.chomp
    puts "Enter the author's first name:"
    author_first_name = gets.chomp
    puts "Enter the author's last name:"
    author_last_name = gets.chomp
    puts 'Enter the published date (YYYY-MM-DD):'
    publish_date = gets.chomp
    puts 'Enter the publisher:'
    publisher = gets.chomp
    puts 'Enter the cover state:'
    cover_state = gets.chomp
    puts 'Enter the genre:'
    genre = gets.chomp
    puts 'Enter the source:'
    source = gets.chomp

    authors = Storage.load_data('authors') || []
    author = authors.find { |a| a['first_name'] == author_first_name && a['last_name'] == author_last_name }

    if author.nil?
      author_id = authors.length + 1
      author = { 'id' => author_id, 'first_name' => author_first_name, 'last_name' => author_last_name }
      authors << author
      Storage.save_data('authors', authors)
    end

    genres = Storage.load_data('genres') || []
    genre_data = genres.find { |g| g['name'] == genre }

    if genre_data.nil?
      genre_id = genres.length + 1
      genre_data = { 'id' => genre_id, 'name' => genre }
      genres << genre_data
      Storage.save_data('genres', genres)
    end

    sources = Storage.load_data('sources') || []
    source_data = sources.find { |s| s['name'] == source }

    if source_data.nil?
      source_id = sources.length + 1
      source_data = { 'id' => source_id, 'name' => source }
      sources << source_data
      Storage.save_data('sources', sources)
    end

    books = Storage.load_data('books') || []
    book_id = books.length + 1
    book = Book.new(book_id, title, author, genre_data, source_data, publish_date, publisher, cover_state)
    books << book.to_hash
    Storage.save_data('books', books)

    if book.can_be_archived?
      puts 'The book can be archived.'
    else
      puts 'The book cannot be archived.'
    end

    puts 'Book added successfully!'
  end

  # Implement the remaining add methods (add_music_album, add_movie, add_game) following the same pattern as add_book.
end

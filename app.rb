require_relative 'storage'

class App
  def initialize
    @storage = Storage.new
  end

  def run
    loop do
      display_menu
      option = get_option

      case option
      when 1
        list_books
      when 2
        list_music_albums
      when 3
        list_movies
      when 4
        list_games
      when 5
        list_genres
      when 6
        list_labels
      when 7
        list_authors
      when 8
        list_sources
      when 9
        add_book
      when 10
        add_music_album
      when 11
        add_movie
      when 12
        add_game
      when 0
        puts "\nExiting program..."
        break
      else
        puts "\nInvalid option! Please select again."
      end
    end

    @storage.save_data_to_files
  end

  private

  def display_menu
    puts "\nCatalog of my things"
    puts "1. List all books"
    puts "2. List all music albums"
    puts "3. List all movies"
    puts "4. List all games"
    puts "5. List all genres"
    puts "6. List all labels"
    puts "7. List all authors"
    puts "8. List all sources"
    puts "9. Add a book"
    puts "10. Add a music album"
    puts "11. Add a movie"
    puts "12. Add a game"
    puts "0. Exit"
    print "Select an option: "
  end

  def get_option
    gets.chomp.to_i
  end

  def list_books
    puts "\nList of all books:"
    @storage.genres.each do |genre|
      genre.items.each do |item|
        if item.is_a?(Book)
          display_book_details(item)
        end
      end
    end
  end

  def list_music_albums
    puts "\nList of all music albums:"
    @storage.genres.each do |genre|
      genre.items.each do |item|
        if item.is_a?(MusicAlbum)
          display_music_album_details(item)
        end
      end
    end
  end

  def list_movies
    puts "\nList of all movies:"
    @storage.genres.each do |genre|
      genre.items.each do |item|
        if item.is_a?(Movie)
          display_movie_details(item)
        end
      end
    end
  end

  def list_games
    puts "\nList of all games:"
    @storage.genres.each do |genre|
      genre.items.each do |item|
        if item.is_a?(Game)
          display_game_details(item)
        end
      end
    end
  end

  def list_genres
    puts "\nList of all genres:"
    @storage.genres.each do |genre|
      puts "Genre: #{genre.name}"
    end
  end

  def list_labels
    puts "\nList of all labels:"
    @storage.labels.each do |label|
      puts "Label: #{label.title}"
    end
  end

  def list_authors
    puts "\nList of all authors:"
    @storage.authors.each do |author|
      puts "Author: #{author.name}"
    end
  end

  def list_sources
    puts "\nList of all sources:"
    @storage.sources.each do |source|
      puts "Source: #{source.title}"
    end
  end

  def add_book
    puts "\nAdding a book:"
    print "Enter the title: "
    title = gets.chomp
    print "Enter the author: "
    author = gets.chomp
    print "Enter the genre: "
    genre = gets.chomp

    book = Book.new(title, author, genre)
    @storage.add_item(book)
    puts "Book added successfully!"
  end

  def add_music_album
    puts "\nAdding a music album:"
    print "Enter the title: "
    title = gets.chomp
    print "Enter the artist: "
    artist = gets.chomp
    print "Enter the genre: "
    genre = gets.chomp
    print "Enter the label: "
    label = gets.chomp

    album = MusicAlbum.new(title, artist, genre, label)
    @storage.add_item(album)
    puts "Music album added successfully!"
  end

  def add_movie
    puts "\nAdding a movie:"
    print "Enter the title: "
    title = gets.chomp
    print "Enter the director: "
    director = gets.chomp
    print "Enter the genre: "
    genre = gets.chomp
    print "Enter the source: "
    source = gets.chomp

    movie = Movie.new(title, director, genre, source)
    @storage.add_item(movie)
    puts "Movie added successfully!"
  end

  def add_game
    puts "\nAdding a game:"
    print "Enter the title: "
    title = gets.chomp
    print "Enter the developer: "
    developer = gets.chomp
    print "Enter the genre: "
    genre = gets.chomp
    print "Enter the source: "
    source = gets.chomp

    game = Game.new(title, developer, genre, source)
    @storage.add_item(game)
    puts "Game added successfully!"
  end

  def display_book_details(book)
    puts "\nTitle: #{book.title}"
    puts "Author: #{book.author}"
    puts "Genre: #{book.genre}"
  end

  def display_music_album_details(album)
    puts "\nTitle: #{album.title}"
    puts "Artist: #{album.artist}"
    puts "Genre: #{album.genre}"
    puts "Label: #{album.label}"
  end

  def display_movie_details(movie)
    puts "\nTitle: #{movie.title}"
    puts "Director: #{movie.director}"
    puts "Genre: #{movie.genre}"
    puts "Source: #{movie.source}"
  end

  def display_game_details(game)
    puts "\nTitle: #{game.title}"
    puts "Developer: #{game.developer}"
    puts "Genre: #{game.genre}"
    puts "Source: #{game.source}"
  end
end

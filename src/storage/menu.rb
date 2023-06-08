class Menu
  def initialize(storage)
    @storage = storage
  end

  def display_menu
    loop do
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

      option = gets.chomp.to_i

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
  end

  private

  def list_books
    puts "\nList of all books:"
    @storage.genres.each do |genre|
      genre.items.each do |item|
        if item.is_a?(Book)
          puts "Title: #{item.title}"
          puts "Author: #{item.author.full_name}"
          puts "Genre: #{item.genre.name}"
          puts "Publisher: #{item.publisher}"
          puts "Cover State: #{item.cover_state}"
          puts "Archived: #{item.archived}"
          puts ""
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
      puts "Author: #{author.full_name}"
    end
  end

  def list_sources
    puts "\nList of all sources:"
    @storage.sources.each do |source|
      puts "Source: #{source.name}"
    end
  end

  def add_book
    puts "\nAdd a book:"
    print "Title: "
    title = gets.chomp
    print "Author's first name: "
    first_name = gets.chomp
    print "Author's last name: "
    last_name = gets.chomp
    print "Genre: "
    genre_name = gets.chomp
    print "Publisher: "
    publisher = gets.chomp
    print "Published_date(YYYY/MM/DD): "
    published_date = gets.chomp
    print "Cover state: "
    cover_state = gets.chomp
    print "Archived (true/false): "
    archived = gets.chomp.downcase == 'true'

    author = Author.new(nil, first_name, last_name)
    genre = Genre.new(nil, genre_name)
    item = Book.new(nil, genre, author, nil, nil, published_date, archived, cover_state)
    genre.add_item(item)
    author.add_item(item)

    puts "Book added successfully!"
  end
end

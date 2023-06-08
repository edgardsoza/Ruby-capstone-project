require 'json'
require 'date'

# Load data from JSON files
genres = load_data('genres.json') || []
authors = load_data('authors.json') || []
sources = load_data('sources.json') || []
labels = load_data('labels.json') || []
books = load_data('books.json') || []

# Helper method to load data from JSON files
def load_data(filename)
  JSON.parse(File.read(filename), object_class: OpenStruct)
end

# Helper method to save data to JSON files
def save_data(filename, data)
  File.open(filename, 'w') do |file|
    file.write(JSON.pretty_generate(data))
  end
end

# Helper method to prompt user for input
def prompt(message)
  print message
  gets.chomp
end

# Main menu
loop do
  puts "\nMain Menu:"
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
  puts "13. Quit"

  choice = prompt("\nEnter your choice (1-13): ").to_i

  case choice
  when 1
    # List all books
    puts "\nList of all books:"
    # Code to list all books goes here

  when 2
    # List all music albums
    puts "\nList of all music albums:"
    # Code to list all music albums goes here

  when 3
    # List all movies
    puts "\nList of all movies:"
    # Code to list all movies goes here

  when 4
    # List all games
    puts "\nList of all games:"
    # Code to list all games goes here

  when 5
    # List all genres
    puts "\nList of all genres:"
    genres.each do |genre|
      puts "#{genre.id}. #{genre.name}"
    end

  when 6
    # List all labels
    puts "\nList of all labels:"
    labels.each do |label|
      puts "#{label.id}. #{label.title} (#{label.color})"
    end

  when 7
    # List all authors
    puts "\nList of all authors:"
    authors.each do |author|
      puts "#{author.id}. #{author.first_name} #{author.last_name}"
    end

  when 8
    # List all sources
    puts "\nList of all sources:"
    sources.each do |source|
      puts "#{source.id}. #{source.name}"
    end

  when 9
    # Add a book
    puts "\nAdd a book:"
    genre_id = prompt("Enter the genre ID: ").to_i
    author_id = prompt("Enter the author ID: ").to_i
    source_id = prompt("Enter the source ID: ").to_i
    label_id = prompt("Enter the label ID: ").to_i
    publish_date = Date.parse(prompt("Enter the publish date (YYYY-MM-DD): "))
    publisher = prompt("Enter the publisher: ")
    cover_state = prompt("Enter the cover state: ")

    genre = genres.find { |g| g.id == genre_id }
    author = authors.find { |a| a.id == author_id }
    source = sources.find { |s| s.id == source_id }
    label = labels.find { |l| l.id == label_id }

    if genre.nil?
      puts "Genre not found. Book cannot be added."
    elsif author.nil?
      puts "Author not found. Book cannot be added."
    elsif source.nil?
      puts "Source not found. Book cannot be added."
    elsif label.nil?
      puts "Label not found. Book cannot be added."
    else
      # Create a new Book object and add it to the respective collections
      new_book = Book.new(books.size + 1, genre, author, source, label, publish_date, publisher, cover_state)
      books << new_book
      genre.add_item(new_book)
      author.add_item(new_book)
      source.add_item(new_book)
      label.add_item(new_book)
      save_data('books.json', books)
      puts "Book added successfully!"
    end

  when 10
    # Add a music album
    puts "\nAdd a music album:"
    # Code to add a music album goes here

  when 11
    # Add a movie
    puts "\nAdd a movie:"
    # Code to add a movie goes here

  when 12
    # Add a game
    puts "\nAdd a game:"
    # Code to add a game goes here

  when 13
    # Quit the app
    puts "\nGoodbye!"
    break

  else
    puts "\nInvalid choice. Please try again."
  end
end

require 'json'
require 'date'
require_relative './src/genre'
require_relative './src/source'
require_relative './src/author'
require_relative './src/items/item'
require_relative './src/items/label'
require_relative './src/items/book'

# Load data from JSON files
def load_data_from_files
  genres = []
  authors = []
  sources = []
  labels = []
  items = []

  # Load genres from genres.json
  if File.exist?('genres.json')
    genres_data = JSON.parse(File.read('genres.json'))
    genres_data.each do |genre_data|
      genre = Genre.new(genre_data['id'], genre_data['name'])
      genres << genre
    end
  end

  # Load authors from authors.json
  if File.exist?('authors.json')
    authors_data = JSON.parse(File.read('authors.json'))
    authors_data.each do |author_data|
      author = Author.new(author_data['id'], author_data['first_name'], author_data['last_name'])
      authors << author
    end
  end

  # Load sources from sources.json
  if File.exist?('sources.json')
    sources_data = JSON.parse(File.read('sources.json'))
    sources_data.each do |source_data|
      source = Source.new(source_data['id'], source_data['name'])
      sources << source
    end
  end

  # Load labels from labels.json
  if File.exist?('labels.json')
    labels_data = JSON.parse(File.read('labels.json'))
    labels_data.each do |label_data|
      label = Label.new(label_data['id'], label_data['title'], label_data['color'])
      labels << label
    end
  end

  # Load items from items.json
  if File.exist?('items.json')
    items_data = JSON.parse(File.read('items.json'))
    items_data.each do |item_data|
      genre_id = item_data['genre']['id']
      genre = genres.find { |g| g.id == genre_id }

      author_id = item_data['author']['id']
      author = authors.find { |a| a.id == author_id }

      source_id = item_data['source']['id']
      source = sources.find { |s| s.id == source_id }

      label_id = item_data['label']['id']
      label = labels.find { |l| l.id == label_id }

      if item_data['type'] == 'Book'
        item = Book.new(item_data['id'], genre, author, source, label, item_data['publish_date'], item_data['archived'], item_data['cover_state'])
      elsif item_data['type'] == 'MusicAlbum'
        item = MusicAlbum.new(item_data['id'], genre, author, source, label, item_data['publish_date'], item_data['archived'], item_data['on_spotify'])
      elsif item_data['type'] == 'Movie'
        item = Movie.new(item_data['id'], genre, author, source, label, item_data['publish_date'], item_data['archived'], item_data['silent'])
      elsif item_data['type'] == 'Game'
        item = Game.new(item_data['id'], genre, author, source, label, item_data['publish_date'], item_data['archived'], item_data['multiplayer'], item_data['last_played_at'])
      end

      genre.add_item(item)
      author.add_item(item)
      source.add_item(item)
      label.add_item(item)
      items << item
    end
  end

  [genres, authors, sources, labels, items]
end

# Save data to JSON files
def save_data_to_files(genres, authors, sources, labels, items)
  File.write('genres.json', JSON.generate(genres.map { |g| { 'id' => g.id, 'name' => g.name } }))
  File.write('authors.json', JSON.generate(authors.map { |a| { 'id' => a.id, 'first_name' => a.first_name, 'last_name' => a.last_name } }))
  File.write('sources.json', JSON.generate(sources.map { |s| { 'id' => s.id, 'name' => s.name } }))
  File.write('labels.json', JSON.generate(labels.map { |l| { 'id' => l.id, 'title' => l.title, 'color' => l.color } }))
  File.write('items.json', JSON.generate(items.map { |i| { 'id' => i.id, 'genre' => { 'id' => i.genre.id, 'name' => i.genre.name }, 'author' => { 'id' => i.author.id, 'first_name' => i.author.first_name, 'last_name' => i.author.last_name }, 'source' => { 'id' => i.source.id, 'name' => i.source.name }, 'label' => { 'id' => i.label.id, 'title' => i.label.title, 'color' => i.label.color }, 'publish_date' => i.publish_date.to_s, 'archived' => i.archived, 'cover_state' => i.cover_state, 'on_spotify' => i.on_spotify, 'silent' => i.silent, 'multiplayer' => i.multiplayer, 'last_played_at' => i.last_played_at.to_s, 'type' => i.class.to_s } }))
end

# Load data from JSON files
genres, authors, sources, labels, items = load_data_from_files

# Main menu
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
    puts "\nList of all books:"
    genres.each do |genre|
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
  when 2
    puts "\nList of all music albums:"
    genres.each do |genre|
      genre.items.each do |item|
        if item.is_a?(MusicAlbum)
          puts "Title: #{item.title}"
          puts "Artist: #{item.artist}"
          puts "Genre: #{item.genre.name}"
          puts "On Spotify: #{item.on_spotify}"
          puts "Archived: #{item.archived}"
          puts ""
        end
      end
    end
  when 3
    puts "\nList of all movies:"
    genres.each do |genre|
      genre.items.each do |item|
        if item.is_a?(Movie)
          puts "Title: #{item.title}"
          puts "Director: #{item.director}"
          puts "Genre: #{item.genre.name}"
          puts "Silent: #{item.silent}"
          puts "Archived: #{item.archived}"
          puts ""
        end
      end
    end
  when 4
    puts "\nList of all games:"
    genres.each do |genre|
      genre.items.each do |item|
        if item.is_a?(Game)
          puts "Title: #{item.title}"
          puts "Developer: #{item.developer}"
          puts "Genre: #{item.genre.name}"
          puts "Multiplayer: #{item.multiplayer}"
          puts "Last Played At: #{item.last_played_at}"
          puts "Archived: #{item.archived}"
          puts ""
        end
      end
    end
  when 5
    puts "\nList of all genres:"
    genres.each do |genre|
      puts "Genre: #{genre.name}"
    end
  when 6
    puts "\nList of all labels:"
    labels.each do |label|
      puts "Label: #{label.title}"
    end
  when 7
    puts "\nList of all authors:"
    authors.each do |author|
      puts "Author: #{author.full_name}"
    end
  when 8
    puts "\nList of all sources:"
    sources.each do |source|
      puts "Source: #{source.name}"
    end
  when 9
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
  
    author_id = (authors.last&.id || 0) + 1
    authors << Author.new(author_id, first_name, last_name)
  
    genre = genres.find { |g| g.name == genre_name }
    if genre.nil?
      genre_id = (genres.last&.id || 0) + 1
      genre = Genre.new(genre_id, genre_name)
      genres << genre
    end
  
    item_id = (items.last&.id || 0) + 1
    item = Book.new(item_id, genre, authors.last, nil, nil, published_date, publisher, cover_state)
    items << item
  
    genre.add_item(item)
    authors.last.add_item(item)
  when 10
    # Add a music album
    # ...
  when 11
    # Add a movie
    # ...
  when 12
    # Add a game
    # ...
  when 0
    puts "\nExiting program..."
    break
  else
    puts "\nInvalid option! Please select again."
  end
end

# Save data to JSON files
save_data_to_files(genres, authors, sources, labels, items)

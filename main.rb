require_relative './app'

loop do
  puts 'Catalog of my things - Options:'
  puts '1. List all books'
  puts '2. List all music albums'
  puts '3. List all movies'
  puts '4. List all games'
  puts '5. List all genres'
  puts '6. List all labels'
  puts '7. List all authors'
  puts '8. List all sources'
  puts '9. Add a book'
  puts '10. Add a music album'
  puts '11. Add a movie'
  puts '12. Add a game'
  puts '0. Quit'

  choice = gets.chomp.to_i

  case choice
  when 1
    App.list_all_books
  when 2
    App.list_all_music_albums
  when 3
    App.list_all_movies
  when 4
    App.list_all_games
  when 5
    App.list_all_genres
  when 6
    App.list_all_labels
  when 7
    App.list_all_authors
  when 8
    App.list_all_sources
  when 9
    App.add_book
  when 10
    # Implement the option to add a music album
  when 11
    # Implement the option to add a movie
  when 12
    # Implement the option to add a game
  when 0
    puts 'Quiting App'
    break
  else
    puts 'Invalid choice! Please try again.'
  end

  puts "\n"
end
=======
require_relative 'app'

# Main class
class Main
  def initialize
    @app = Application.new
  end

  def menu
    puts 'Welcome to my application - Catalog of my things'
    puts "
    Please input the option based on the items below:\n
    1 - List all books \n    2 - List all music albums \n    3 - List all games \n    4 - List all genres
    5 - List all labels \n    6 - List all authors \n    7 - Add a book
    8 - Add a music album
    9 - Add a game \n   10 - Add Genre \n   11 - Add an author \n   12 - Exit"
  end

  def prompt
    menu
    choice = gets.chomp
    options(choice)
    prompt until @choice == 10
  end

  def hash_options
    { '1' => :list_all_books,
      '2' => :list_all_music_albums,
      '3' => :list_all_games,
      '4' => :list_all_genres,
      '5' => :list_all_labels,
      '6' => :list_all_authors,
      '7' => :add_book,
      '8' => :add_music_album,
      '9' => :add_game,
      '10' => :add_genre, '11' => :add_author }
  end

  def options(choice)
    if choice == '12'
      exit
    elsif hash_options[choice]
      @app.send(hash_options[choice])
    else
      print 'Please enter a valid option: '
      valid_option = gets.chomp
      options(valid_option)
    end
  end
end

app = Main.new
app.prompt

# frozen_string_literal: true

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

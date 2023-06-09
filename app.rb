require 'json'
require_relative 'game'
require_relative 'author'
require_relative 'data_module'
require_relative 'music_album'
require_relative 'genre'

# class application
class Application
  include DataModule
  attr_accessor :books, :games, :music_albums, :genres, :labels

  def initialize
    @books = []
    @games = []
    @music_albums = load_music_albums
    @genres = load_genres
    @labels = []
    @authors = []
  end

  def wait_for_keypress
    puts 'Press any key to continue...'
    gets
  end

  def clear_screen
    system('cls')
    system('clear')
  end

  def add_game
    print 'Is the game multiplayer?: (Y/N) '
    multiplayer = gets.chomp.downcase == 'y'
    print 'Enter last date the game was played (YYYY-MM-DD): '
    last_played_at = gets.chomp
    game = Game.new(multiplayer, last_played_at)
    save_game(game)
    @games << game
    puts 'Game addedd successfully'
    wait_for_keypress
    clear_screen
  end

  def save_game(game)
    game_tojson = {
      id: game.id, last_played_at: game.last_played_at, multiplayer: game.multiplayer
    }
    if File.exist?('./data/game_list.json')
      file = File.exist?('./data/game_list.json') ? JSON.parse(File.read('./data/game_list.json')) : []
      file.push(game_tojson)
      File.write('./data/game_list.json', JSON.pretty_generate(file))
    else
      File.write('./data/game_list.json', JSON.pretty_generate([game_tojson]))
    end
  end

  def list_all_games
    puts 'List of Games'
    games = File.exist?('./data/game_list.json') ? JSON.parse(File.read('./data/game_list.json')) : []
    if games.empty?
      puts 'No games to display'
    else
      games.each do |game|
        puts "Last played at: #{game['last_played_at']}, Is Multiplayer: #{game['multiplayer']}, Id: #{game['id']}"
      end
    end
    wait_for_keypress
    clear_screen
  end

  def add_author
    print 'Enter author\'s first name: '
    first_name = gets.chomp
    print 'Enter author\'s last name: '
    last_name = gets.chomp
    author = Author.new(first_name, last_name)
    @authors << author
    save_author(author)
    puts 'Author addedd successfully'
    wait_for_keypress
    clear_screen
  end

  def save_author(author)
    author_tojson = {
      first_name: author.first_name, last_name: author.last_name
    }
    if File.exist?('./data/author_list.json')
      file = JSON.parse(File.read('./data/author_list.json'))
      file.push(author_tojson)
      File.write('./data/author_list.json', JSON.pretty_generate(file))
    else
      File.write('./data/author_list.json', JSON.pretty_generate([author_tojson]))
    end
  end

  def list_all_authors
    puts 'List of Authors'
    authors = File.exist?('./data/author_list.json') ? JSON.parse(File.read('./data/author_list.json')) : []
    if authors.empty?
      puts 'No Authors to display'
    else
      authors.each do |author|
        puts "#{author['first_name']}, #{author['last_name']}"
      end
    end
    wait_for_keypress
    clear_screen
  end

  # create a method for list all the music albums
  def list_all_music_albums
    puts 'No music albums found' if music_albums.empty?
    puts 'LIST OF MUSIC ALBUMS:'
    music_albums.each_with_index do |music_album, index|
      puts "#{index + 1} Publish date: #{music_album.publish_date}, On spotify: #{music_album.on_spotify}"
    end
    puts '------------------'
    wait_for_keypress
    clear_screen
  end

  # create a method for list all the genres
  def list_all_genres
    return 'No genres found' if genres.empty?

    genres.each_with_index do |genre, index|
      puts "#{index + 1} ID: #{genre.id}, Name: #{genre.name}"
    end
    puts '------------------'
    wait_for_keypress
    clear_screen
  end

  # create a method for add a music album
  def add_music_album
    puts 'Please enter the pushlish date[YYYY-MM-DD]'
    publish_date = gets.chomp
    puts 'Please enter if the album is on spotify [y/n]'
    on_spotify1 = gets.chomp
    case on_spotify1
    when 'y'
      on_spotify = true
    when 'n'
      on_spotify = false
    else
      puts 'Please enter a valid option'
    end
    album = MusicAlbum.new(publish_date, on_spotify)
    @music_albums << album
    store_music_albums
    puts 'Album entered successfully'
    wait_for_keypress
    clear_screen
  end

  def add_genre
    puts 'Please enter the name of the genre'
    name = gets.chomp
    genre = Genre.new(name)
    @genres << genre
    store_genres
    puts 'Genre entered successfully'
    wait_for_keypress
    clear_screen
  end
end

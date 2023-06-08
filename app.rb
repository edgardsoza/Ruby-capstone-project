require 'json'
require_relative 'logics'
require_relative 'data_module'

class Application
  include DataModule
  include MainMethods

  def initialize
    @main_menu_options = [
      { name: 'List all music albums', value: 1 },
      { name: 'List all genres', value: 2 },
      { name: 'Add a music album', value: 3 },
      { name: 'Add a genre', value: 4 },
      { name: 'Quit', value: 5 }
    ]

    @genres = load_genres
    @music_albums = load_music_albums
  end

  def print_menu(title, main_menu_options)
    puts title
    main_menu_options.each do |option|
      puts "#{option[:value]}) #{option[:name]}"
    end
  end

  def valid_iput?(input, main_menu_options)
    valid_options = main_menu_options.map { |option| option[:value].to_s }
    valid_options.include?(input)
  end

  def get_user_input(main_menu_options)
    input = gets.chomp
    loop do
      break if valid_iput?(input, main_menu_options)

      puts 'please enter a valid option'
      input = gets.chomp
    end
    input
  end

  def start
    print_menu('Please select options', @main_menu_options)
    input = get_user_input(@main_menu_options)
    case input
    when '1'
      list_music_albums(@music_albums)
    when '2'
      list_genres(@genres)
    when '3'
      @music_albums.push(add_music_album)
      store_music_albums
    when '4'
      @genres.push(add_genre)
      store_genres
    when '5'
      store_music_albums
      store_genres
      exit
    end
  end
require_relative 'game'
require_relative 'author'

# class application
class Application
  attr_reader :books, :games, :music_albums, :genres, :labels

  def initialize
    @books = []
    @games = []
    @music_albums = []
    @genres = []
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
  end
end

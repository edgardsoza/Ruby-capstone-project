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
end

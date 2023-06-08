require_relative './src/storage/storage'
require_relative './src/storage/menu'

class App
  def initialize
    @storage = Storage.new
    @menu = Menu.new(@storage)
  end

  def start
    @storage.load_data_from_files
    @menu.display_menu
    @storage.save_data_to_files
  end
end

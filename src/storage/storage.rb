# storage.rb
require 'json'

# This implements the storage class
class Storage
  DATA_FOLDER = 'data'.freeze

  def self.load_data(file_name)
    file_path = "#{DATA_FOLDER}/#{file_name}.json"
    return JSON.parse(File.read(file_path)) if File.exist?(file_path)

    nil
  end

  def self.save_data(file_name, data)
    FileUtils.mkdir_p(DATA_FOLDER)
    file_path = "#{DATA_FOLDER}/#{file_name}.json"
    File.write(file_path, JSON.pretty_generate(data))
  end
end

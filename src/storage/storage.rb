require 'json'
require_relative '../items/book'
require_relative '../items/item'
require_relative '../bibliography/author'
require_relative '../bibliography/genre'
require_relative '../bibliography/label'
require_relative '../bibliography/source'

class Storage
  DATA_FILES = %w[genres.json authors.json sources.json labels.json items.json].freeze

  def initialize
    @genres = []
    @authors = []
    @sources = []
    @labels = []
    @items = []
  end

  def load_data_from_files
    DATA_FILES.each do |file|
      next unless File.exist?(file)

      data = JSON.parse(File.read(file))
      send("load_#{file.gsub('.json', '')}", data)
    end
  end

  def save_data_to_files
    DATA_FILES.each do |file|
      data = send("data_to_#{file.gsub('.json', '')}")
      file_path = File.join('src', 'storage', file)
      File.write(file_path, JSON.generate(data))
    end
  end
  

  private

  def load_genres(data)
    data.each do |genre_data|
      genre = Genre.new(genre_data['id'], genre_data['name'])
      @genres << genre
    end
  end

  def load_authors(data)
    data.each do |author_data|
      author = Author.new(author_data['id'], author_data['first_name'], author_data['last_name'])
      @authors << author
    end
  end

  def load_sources(data)
    data.each do |source_data|
      source = Source.new(source_data['id'], source_data['name'])
      @sources << source
    end
  end

  def load_labels(data)
    data.each do |label_data|
      label = Label.new(label_data['id'], label_data['title'], label_data['color'])
      @labels << label
    end
  end

  def load_items(data)
    data.each do |item_data|
      genre_id = item_data['genre']['id']
      genre = @genres.find { |g| g.id == genre_id }

      author_id = item_data['author']['id']
      author = @authors.find { |a| a.id == author_id }

      source_id = item_data['source']['id']
      source = @sources.find { |s| s.id == source_id }

      label_id = item_data['label']['id']
      label = @labels.find { |l| l.id == label_id }

      item = case item_data['type']
             when 'Book'
               Book.new(item_data['id'], genre, author, source, label, item_data['publish_date'], item_data['archived'], item_data['cover_state'])

             end

      genre.add_item(item)
      author.add_item(item)
      source.add_item(item)
      label.add_item(item)
      @items << item
    end
  end

  def data_to_genres
    @genres.map { |g| { 'id' => g.id, 'name' => g.name } }
  end

  def data_to_authors
    @authors.map { |a| { 'id' => a.id, 'first_name' => a.first_name, 'last_name' => a.last_name } }
  end

  def data_to_sources
    @sources.map { |s| { 'id' => s.id, 'name' => s.name } }
  end

  def data_to_labels
    @labels.map { |l| { 'id' => l.id, 'title' => l.title, 'color' => l.color } }
  end

  def data_to_items
    @items.map do |i|
      {
        'id' => i.id,
        'genre' => { 'id' => i.genre.id, 'name' => i.genre.name },
        'author' => { 'id' => i.author.id, 'first_name' => i.author.first_name, 'last_name' => i.author.last_name },
        'source' => { 'id' => i.source.id, 'name' => i.source.name },
        'label' => { 'id' => i.label.id, 'title' => i.label.title, 'color' => i.label.color },
        'publish_date' => i.publish_date.to_s,
        'archived' => i.archived,
        'cover_state' => i.cover_state,
        'type' => i.class.to_s
      }
    end
  end
end

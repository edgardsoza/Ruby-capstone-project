require_relative '../classes/author'
require_relative '../classes/item'

describe Author do
  author = Author.new('Jose', 'Perez')

  context 'Testing the Author class' do
    it 'should create a new author with name and last name' do
      expect(author.first_name).to eq('Jose')
      expect(author.last_name).to eq('Perez')
    end

    it 'should generate a random ID' do
      expect(author.id).to be_an(Integer)
    end

    it 'should initialize the items array as empty' do
      expect(author.items).to be_empty
    end

    it 'should add the item to the author\'s items' do
      item = Item.new('2022-01-01')
      author.add_item(item)
      expect(author.items).to include(item)
    end
  end
end

describe Item do
  context 'Testing the Item class' do
    it 'should have an ID' do
      item = Item.new('2022-01-01')
      expect(item.id).to be_an(Integer)
    end

    it 'should have a publish date' do
      item = Item.new('2022-01-01')
      expect(item.publish_date).to eq('2022-01-01')
    end

    it 'should not be archived initially' do
      item = Item.new('2022-01-01')
      expect(item.archived).to be(false)
    end

    it 'should be able to set the genre' do
      item = Item.new('2022-01-01')
      genre = Genre.new('Mystery')
      item.genre = genre
      expect(item.genre).to eq(genre)
      expect(genre.items).to include(item)
    end

    it 'should be moved to the archive if it can be archived' do
      item = Item.new('2010-01-01')
      item.move_to_archive
      expect(item.archived).to be(true)
    end

    it 'should not be moved to the archive if it cannot be archived' do
        item = Item.new('2023-01-01')
        item.move_to_archive
        expect(item.archived).to be(false)
    end
  end
end

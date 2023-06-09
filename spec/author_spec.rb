require_relative '../classes/author'
require_relative '../classes/game'

describe Author do
  author = Author.new('Jose', 'Perez')
  context 'Testing the Auth' do
    it 'The initialize method should create a new author with name and last name' do
      expect(author.first_name).to eq 'Jose'
      expect(author.last_name).to eq 'Perez'
    end
    it 'generates a random ID' do
      expect(author.id).to be_an(Integer)
    end
    it 'initializes the items array as empty' do
      expect(author.items).to be_empty
    end
    it 'adds the item to the author\'s items' do
      item = Item.new('2022-01-01')
      author.add_item(item)
      expect(author.items).to include(item)
    end
  end
end

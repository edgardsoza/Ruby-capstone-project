require_relative '../genre'
require_relative '../item'

describe Genre do
  genre = Genre.new('Rock', 1)
  context 'when initialized' do
    it 'has a name' do
      expect(genre.name).to eq('Rock')
    end
  end
  context 'when adding an item' do
    it 'has an item' do
      item = Item.new('2020-01-01', 1)
      genre.add_item(item)
      expect(genre.items).to include(item)
    end
  end
end

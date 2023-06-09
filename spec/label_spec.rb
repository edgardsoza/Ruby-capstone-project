require_relative '../classes/label'
require_relative '../classes/item'

describe Label do
  context 'Testing the Label' do
    it 'The initialize method should create a new label with title and color' do
      label_title = 'Important'
      label_color = 'red'
      label = Label.new(label_title, label_color)
      expect(label.title).to eq label_title
      expect(label.color).to eq label_color
    end

    it 'generates a random ID' do
      label_title = 'Important'
      label_color = 'red'
      label = Label.new(label_title, label_color)
      expect(label.id).to be_an(Integer)
    end

    it 'initializes the items array as empty' do
        label_title = 'Important'
        label_color = 'red'
        label = Label.new(label_title, label_color)
        expect(label.items).to be_empty
      end

    it 'adds the item to the label\'s items' do
        label_title = 'Important'
        label_color = 'red'
        label = Label.new(label_title, label_color)
        item = Item.new('2022-01-01')
        label.add_item(item)
        expect(label.items).to include(item)
    end
  
    it 'sets the label of the item to the current label' do
        label_title = 'Important'
        label_color = 'red'
        label = Label.new(label_title, label_color)
        item = Item.new('2022-01-01')
        label.add_item(item)
        expect(item.label).to eq(label)
    end
  end
end

require_relative '../classes/book'

describe Book do
  context 'when creating a new Book' do
    it 'should have the correct publish date, cover state, and publisher' do
      publish_date = '2023-01-01'
      cover_state = 'good'
      publisher = 'ABC Publishing'
      book = Book.new(publish_date, cover_state, publisher)

      expect(book.publish_date).to eq publish_date
      expect(book.cover_state).to eq cover_state
      expect(book.publisher).to eq publisher
    end
  end

  context 'when determining if the Book can be archived' do
    it 'should return true when cover state is "bad"' do
      book = Book.new('2023-01-01', 'bad', 'ABC Publishing')
      expect(book.can_be_archived?).to be true
    end

    it 'should return the value from the parent class when cover state is not "bad"' do
      book = Book.new('2023-01-01', 'good', 'ABC Publishing')
      allow(book).to receive(:super).and_return(false)
      expect(book.can_be_archived?).to be false
    end
  end
end

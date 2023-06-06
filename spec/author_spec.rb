# frozen_string_literal: true

require_relative '../author'
require_relative '../game'

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
  end
end

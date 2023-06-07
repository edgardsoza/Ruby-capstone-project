# frozen_string_literal: true

require_relative '../game'

describe Game do
  last_played_at = Date.today - 1
  game = Game.new(true, last_played_at)

  context 'Testing the Game class methods' do
    it 'Testing if when creating a game, multiplayer is true based on the input' do
      expect(game.multiplayer).to eq(true)
    end
    it 'testing the last_played_at attribute' do
      expect(game.last_played_at).to eq(last_played_at)
    end
    it 'returns true if the parent\'s method returns true and last_played_at is older than 2 years' do
      allow(game).to receive(:super).and_return(true)
      expect(game.can_be_archived?).to eq(false)
    end
  end
end

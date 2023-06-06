# frozen_string_literal: true

require_relative 'item'
require 'date'

# game class
class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(multiplayer, last_played_at)
    super('genre', 'author', 'source', 'label', last_played_at.to_s)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    super && last_played_at < (Date.today - 2 * 365)
  end
end

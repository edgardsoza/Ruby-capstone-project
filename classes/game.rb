require_relative 'item'
require 'date'

# game class
class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(multiplayer, last_played_at)
    super(last_played_at.to_s)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    super && (Date.today.year - @last_played_at.year) <= 2
  end
end

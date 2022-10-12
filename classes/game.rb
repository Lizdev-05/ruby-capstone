require_relative './item'
require 'date'

class Game < Item
  attr_reader :multiplayer, :last_played_at

  def initialize(multiplayer, last_played_at, *args)
    super(*args)
    @multiplayer = multiplayer
    @last_played_at = Date.parse(last_played_at)
  end

  def can_be_archived?
    return true if super 

    false
  end
end
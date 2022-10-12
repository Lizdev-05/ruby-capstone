
require_relative './item'

class Game < Item
  attr_reader :multiplayer, :last_played_at

  def initialize(multiplayer, last_played_at, *args)
    super(*args)
    @multiplayer = multiplayer
    @last_played_at = Date.parse(last_played_at)
  end

  def can_be_archived?
    return true if super && (Date.today - @last_played_at > (365 * 2))

    false
  end
end
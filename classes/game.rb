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

  def self.convert_to_json(data)
    games = []
    data.each do |game|
      games << { id: game.id, multiplayer: game.multiplayer, last_played_at: game.last_played_at,
                 publish_date: game.publish_date }
    end
    games
  end

  def self.convert_to_obj(data)
    games = []
    data.each do |game|
      games << Game.new(game['multiplayer'], game['last_played_at'], game['publish_date'])
    end
    games
  end
end
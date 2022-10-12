require 'json'
require './classes/game'

class Application
  attr_reader :books, :games, :music_albums, :genres, :labels, :authors

  def initialize
    @games = []
  end 

  #Add gameas and associated author
  def add_game
    puts 'Add a game'
    print 'Publish date (YYYY-MM-DD): '
    publish_date = gets.chomp
    print 'Multiplayer [true/false]: '
    multiplayer = gets.chomp
    print 'Last played at: '
    last_played_at = gets.chomp
    game = Game.new(multiplayer, last_played_at, publish_date)
    @games << game
    save_game(game)
    puts 'Successfully added a game!'
  end 

  def save_game(game)
    store = { id: game.id, multiplayer: game.multiplayer, last_played_at: game.last_played_at,
    publish_date: game.publish_date }

    file = File.size('./data/games.json').zero? ? [] : JSON.parse(File.read('./data/games.json'))
    file.push(store)
    File.write('./data/games.json', JSON.pretty_generate(file))
  end 
  
  # List all games 
  def list_all_games
    puts "\n \n"
      content = []
      content = File.size('./data/games.json').zero? ? [] : JSON.parse(File.read('./data/games.json'))
      if content.length.zero?
        puts 'No games to display'
      else
        content.each do |game|
          puts "multiplayer: #{game['multiplayer']}, last_played_at: #{game['last_played_at']}, publish_date: #{game['publish_date']}"
        end
      end
  end
end
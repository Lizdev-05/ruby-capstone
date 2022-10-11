require './classes/create_list.rb'
require './classes/data'
require './classes/game'
require './classes/author'

class Application
  def initialize
    @games = Game.convert_to_obj(Data.read_from_file('games.json'))
  end

  def add_book 
  end

  def list_all_books
  end

  def add_game
    puts 'Add a game'
    print 'Publish date (YYYY-MM-DD): '
    publish_date = gets.chomp

    print 'Multiplayer [true/false]: '
    multiplayer = gets.chomp

    print 'Last played at: '
    last_played_at = gets.chomp

    new_game = Game.new(multiplayer, last_played_at, publish_date)
    @games << new_game

    print 'Would you like to add an author [Y/N]: '
    return unless answer_yes?
    add_author(new_game)
    print 'successfully added an author'
  end

  def list_all_games
    ListCreator.new.list_all('games', @games)
  end

  def save_all
    Data.save_to_file(Game.convert_to_json(@games), 'games.json')
  end 
end 




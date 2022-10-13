require 'json'
require './classes/book'
require './classes/label'
require '././classes/genre'
require '././classes/music'
require './classes/game'
require './classes/author'
require './savedata'

SAVE = Savedata.new

class Application
  attr_reader :books, :games, :music_albums, :genres, :labels, :authors

  def initialize
    @books = []
    @games = []
    @music_albums = []
    @genres = []
    @labels = []
    @authors = []
  end

  # add label to book
  def add_label(item)
    puts 'Enter label title:'
    title = gets.chomp
    puts 'Enter label color:'
    color = gets.chomp
    label = Label.new(title, color)
    label.add_item(item)
    @labels << label
    puts "Label #{label.title} was added"
    SAVE.save_labels(label)
  end

  # list all labels
  def list_all_labels
    puts 'List of all labels:'
    labels = File.size('./data/labels.json').zero? ? [] : JSON.parse(File.read('./data/labels.json'))
    labels.each do |l|
      puts "Label id: #{l['id']}, title: #{l['title']}, color: #{l['color']}"
    end
  end
  # add book method

  def add_book
    print 'Enter book publisher:'
    publisher = gets.chomp
    print 'Enter book cover state:'
    cover_state = gets.chomp
    print 'Enter publish date (format: YYYY-MM-DD): '
    publish_date = gets.chomp
    book = Book.new(publisher, cover_state, publish_date)
    add_label(book)
    @books << book
    SAVE.save_books(book)
    puts "Book #{book.publisher} was added"
  end

  #  Genre part
  def add_genre(item)
    print 'Enter genre name: '
    name = gets.chomp

    genre = Genre.new(name)
    genre.add_item(item)
    SAVE.store_genre(genre)
  end

  def list_all_genres
    puts 'List of genres'
    genres = File.size('./data/genre_list.json').zero? ? [] : JSON.parse(File.read('./data/genre_list.json'))
    genres.each do |genre|
      puts "Genre: #{genre['id']} -  #{genre['name']}"
    end
  end

  #  Music part

  def add_music_album
    print 'Is the music on sportify? (Y/N): '
    sportify_value = gets.chomp.downcase == 'y'
    print 'Enter publish date (YYYY-MM-DD): '
    publish_date = gets.chomp
    music = Music.new(publish_date, sportify_value)
    add_genre(music)
    puts 'Music album added successfully'
    SAVE.store_music(music)
    music
  end

  # list all books
  def list_all_books
    books = File.size('./data/books.json').zero? ? [] : JSON.parse(File.read('./data/books.json'))
    books.each do |b|
      puts "Publisher: #{b['publisher']}, Cover State: #{b['cover_state']}, Publish Date: #{b['publish_date']}"
    end
  end

  def list_all_music_albums
    puts "Music album's list"
    musics = File.size('./data/music_list.json').zero? ? [] : JSON.parse(File.read('./data/music_list.json'))
    musics.each do |music|
      puts "Published date: #{music['publish_date']}, On sportify: #{music['sportify']}, Genre: #{music['genre_id']}"
    end
  end

  # Add games and author
  def add_game
    puts 'Add a game'
    print 'Publish date (YYYY-MM-DD): '
    publish_date = gets.chomp
    print 'Multiplayer [true/false]: '
    multiplayer = gets.chomp
    print 'Last played at: '
    last_played_at = gets.chomp
    game = Game.new(multiplayer, last_played_at, publish_date)
    add_author(game)
    @games << game
    SAVE.save_game(game)
    puts 'Game added successfully'
  end

  # List all games
  def list_all_games
    puts "\n \n"
    content = File.size('./data/games.json').zero? ? [] : JSON.parse(File.read('./data/games.json'))
    if content.length.zero?
      puts 'No games to display'
    else
      content.each do |game|
        puts "multiplayer: #{game['multiplayer']}, \
         last_played_at: #{game['last_played_at']}, \
          publish_date: #{game['publish_date']}"
      end
    end
  end

  # add author method for games
  def add_author(_item)
    puts 'Add author'
    print 'Enter author fist name'
    first_name = gets.chomp
    print 'Enter author last name'
    last_name = gets.chomp
    author = Author.new(first_name, last_name)
    @authors << author
    SAVE.save_author(author)
    puts 'Author added successfully'
  end

  def list_all_authors
    puts "\n \n"
    content = File.size('./data/authors.json').zero? ? [] : JSON.parse(File.read('./data/authors.json'))
    if content.length.zero?
      puts 'No authors to display'
    else
      content.each do |author|
        puts "first_name: #{author['first_name']}, \
         last_name: #{author['last_name']}"
      end
    end
  end
end

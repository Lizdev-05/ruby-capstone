require 'json'
require './classes/book.rb'
require './classes/label.rb'
require '././classes/genre'
require '././classes/music'

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
    save_labels
  end
  
  
  def save_labels
    hash = { id: @labels[0].id, title: @labels[0].title, color: @labels[0].color }

    file = File.size('./data/labels.json').zero? ? [] : JSON.parse(File.read('./data/labels.json'))
    file.push(hash)
    File.write('./data/labels.json', JSON.pretty_generate(file))
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
    save_books(book)
    puts "Book #{book.publisher} was added"
  end

  
  # save books

  def save_books(book)
    new_books = { id: book.id, publisher: book.publisher, cover_state: book.cover_state, publish_date: book.publish_date }
     
    if File.exist?('./data/books.json')
      file = File.size('./data/books.json').zero? ? [] : JSON.parse(File.read('./data/books.json'))
      file.push(new_books)
      File.write('./data/books.json', JSON.pretty_generate(file))
    else
      File.write('./data/books.json', JSON.pretty_generate([new_books]))

  #  Genre part
  def add_genre(item)
    print 'Enter genre name: '
    name = gets.chomp

    genre = Genre.new(name)
    genre.add_item(item)
    store_genre(genre)
  end

  def store_genre(genre)
    hash = { id: genre.id, name: genre.name }

    file = File.size('./data/genre_list.json').zero? ? [] : JSON.parse(File.read('./data/genre_list.json'))
    file.push(hash)
    File.write('./data/genre_list.json', JSON.pretty_generate(file))
  end

  # def list_all_genres
  #   puts 'List of all genres:'
  #   @genres.each do |genre|
  #     puts "Genre: #{genre.id} - #{genre.name}"
  #   end
  # end

  def list_all_genres
    puts 'List of genres'
    genres = File.size('./data/genre_list.json').zero? ? [] : JSON.parse(File.read('./data/genre_list.json'))
    genres.each do |genre|
      puts "Genre: #{genre.id} -  #{genre['name']}"
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
    store_music(music)
    music
  end

  def store_music(music)
    new_music = { id: music.id, publish_date: music.publish_date, sportify: music.on_sportify,
                  genre_id: music.genre.name }
    if File.exist?('./data/music_list.json')
      file = File.size('./data/music_list.json').zero? ? [] : JSON.parse(File.read('./data/music_list.json'))
      file.push(new_music)
      File.write('./data/music_list.json', JSON.pretty_generate(file))
    else
      File.write('./data/music_list.json', JSON.pretty_generate([new_music]))
    end
  end

  # list all books
  def list_all_books
    books = File.size('./data/books.json').zero? ? [] : JSON.parse(File.read('./data/books.json'))
    books.each do |b|
      puts "Publisher: #{b['publisher']}, Cover State: #{b['cover_state']}, Publish Date: #{b['publish_date']}"
    end
  end
end
  def list_all_music_albums
    puts "Music album's list"
    musics = File.size('./data/music_list.json').zero? ? [] : JSON.parse(File.read('./data/music_list.json'))
    musics.each do |music|
      puts "Published date: #{music['publish_date']}, On sportify: #{music['sportify']}, Genre: #{music['genre_id']}"
    end
  end
end

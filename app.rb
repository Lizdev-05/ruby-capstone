require '././classes/genre'
require '././classes/music'
require 'json'
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
    print 'Enter publish date (format: YYYY-MM-DD): '
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

  def list_all_music_albums
    puts 'List of music albums'
    musics = File.size('./data/music_list.json').zero? ? [] : JSON.parse(File.read('./data/music_list.json'))
    musics.each do |music|
      puts "Published date: #{music['publish_date']}, On sportify: #{music['sportify']}, Genre: #{music['genre_id']}"
    end
  end
end

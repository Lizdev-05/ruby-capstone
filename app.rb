require '././classes/genre.rb'
require '././classes/music.rb'
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
      @genres << genre
      store_genre(genre)
      genre
    end

#       def store_genre(genre)
#         hash = {id: genre.id, name: genre.name}

#         file = File.size('./data/genre_list.json').zero? ? [] : JSON.parse(File.read('./data/genre_list.json'))
#         file.push(hash)
#         File.write('./data/genre_list.json', JSON.pretty_generate(file))
#       end

#       def list_all_genres
#         puts 'List of all genres:'
#         @genres.each do |genre|
#           puts "Genre: #{genre.id} - #{genre.name}"
#         end
#       end

#     #  Music part

#       def add_music_album
#         print 'On sportify? (y/n): '
#         sportify_value = gets.chomp
#         print 'Enter publish date: '
#         publish_date = gets.chomp
#         music = Music.new(sportify_value, publish_date)
#         add_genre(music)
#         puts 'Music album added successfully'
#         store_music(music)
#         music
#       end

#       def store_music(music)
#         hash = {id: music.id, sportify: music.sportify, publish_date: music.publish_date}

#         file = File.size('./data/music_album_list.json').zero? ? [] : JSON.parse(File.read('./data/music_album_list.json'))
#         file.push(hash)
#         File.write('./data/music_album_list.json', JSON.pretty_generate(file))
#       end

#       def list_all_music_albums
#         musics = File.size('./data/music_album_list.json').zero? ? [] : JSON.parse(File.read('./data/music_album_list.json'))
#         musics.each do |music|
#           puts "Music album: #{music['id']} - #{music['sportify']} - #{music['publish_date']}"
#         end

#         def list_all_genres
#           genres = File.size('./data/genre_list.json').zero? ? [] : JSON.parse(File.read('./data/genre_list.json'))
#           genres.each do |genre|
#             puts "Genre: #{genre['id']} - #{genre['name']}"
#           end
#         end
#      end
# end
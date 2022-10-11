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

  #Add class functions here
 def add_music_album(date, sportify)
    music = Music.new(date, sportify)
    @music_albums << music
    music
  end

  def add_genre(name)
    genre = Genre.new(name)
    @genres << genre
    genre
  end
end 
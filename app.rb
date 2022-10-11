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

  
end 
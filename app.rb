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
def save_files
  instance_variables.each do |var|
    file = []
    file_name = var.to_s.delete("@")
    instance_variable_get(var).each do |item|
      file.push({ref: item, values: to_hash(item)})
    end

 def add_music_album(date, sportify)
    music = Music.new(date, sportify)
    @music_albums << music
    music
  end

  def display_music_albums
    @music_albums.each do |music|
      puts "Music album: #{music.id} - #{music.date} - #{music.sportify}"
  end
end
  
def recover_music_albums(hash)
   hash.each do |music|
    current_music = music['value']
    date = current_music['date']
    sportify = current_music['sportify']
    add_music_album(date, sportify)
   end
    
  end

  def add_genre(name)
    genre = Genre.new(name)
    @genres << genre
    genre
  end

  def display_genres
    @genres.each do |genre|
      puts "Genre: #{genre.id} - #{genre.name}"
    end
  end
  
  def recover_genres(hash)
   hash.each do |genre|
    current_genre = genre['value']
    name = current_genre['name']
    add_genre(name)
   end
  end

end 
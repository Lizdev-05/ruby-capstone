require './app'

APP = Application.new

class Main
  def menu
    puts 'Welcome to the Catalog of many things console application'
    puts "
    Please choose an option from the list by entering a number:\n
    1 - List all books
    2 - Add a book
    3 - List all games
    4 - Add a game
    5 - List all music albums
    6 - Add a music album
    7 - List all genres
    8 - List all labels
    9 - List all authors
    10 - Exit "
  end

  def run
    loop do
      menu
      choice = gets.chomp.to_i
      options(choice)
      run until @choice == 10
    end
  end

  def options(choice)
    book_menu(choice)
    game_menu(choice)
    music_menu(choice)
    genre_menu(choice)
    label_menu(choice)
    author_menu(choice)
    exit_menu(choice)
  end

  def book_menu(choice)
    case choice
    when 1
      APP.list_all_books
    when 2
      APP.add_book
    end
  end

  def game_menu(choice)
    case choice
    when 3
      APP.list_all_games
    when 4
      APP.add_game
    end
  end

  def music_menu(choice)
    case choice
    when 5
      APP.list_all_music_albums
    when 6
      APP.add_music_album
    end
  end

  def genre_menu(choice)
    case choice
    when 7
      APP.list_all_genres
    end
  end

  def label_menu(choice)
    case choice
    when 8
      APP.list_all_labels
    end
  end

  def author_menu(choice)
    case choice
    when 9
      APP.list_all_authors
    end
  end

  def exit_menu(choice)
    case choice
    when 10
      exit
    end
  end
end

app = Main.new
app.run

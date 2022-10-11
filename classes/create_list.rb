class ListCreator
  def games(games_list)
    puts "\n \n"
    if games_list.length.zero?
      puts 'Games list is empty'
    else
      games_list.map { |game| puts "ID: #{game.id}, Multiplayer: #{game.multiplayer}" }
    end
    puts "\n \n"
  end

  def list_all(list_type, array_list)
    case list_type
    when 'games'
      games(array_list)
    end
  end
end
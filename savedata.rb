require './classes/author'
require './classes/book'
require './classes/game'
require './classes/label'
require './classes/music'
require './classes/genre'
require './classes/item'
require_relative 'app'
require 'json'

# APP = Application.new

class Savedata
  attr_accessor :labels, :books, :games, :authors, :music, :genres

  def initialize
    @labels = []
    @books = []
    @games = []
    @authors = []
    @music = []
    @genres = []
  end

  def save_labels(item)
    hash = { id: item.id, title: item.title, color: item.color }

    file = File.size('./data/labels.json').zero? ? [] : JSON.parse(File.read('./data/labels.json'))
    file.push(hash)
    File.write('./data/labels.json', JSON.pretty_generate(file))
  end

  def store_genre(genre)
    hash = { id: genre.id, name: genre.name }

    file = File.size('./data/genre_list.json').zero? ? [] : JSON.parse(File.read('./data/genre_list.json'))
    file.push(hash)
    File.write('./data/genre_list.json', JSON.pretty_generate(file))
  end

  # save books
  def save_books(book)
    new_books = { id: book.id, publisher: book.publisher, cover_state: book.cover_state,
                  publish_date: book.publish_date }

    if File.exist?('./data/books.json')
      file = File.size('./data/books.json').zero? ? [] : JSON.parse(File.read('./data/books.json'))
      file.push(new_books)
      File.write('./data/books.json', JSON.pretty_generate(file))
    else
      File.write('./data/books.json', JSON.pretty_generate([new_books]))
    end
  end

  def save_game(game)
    store = { id: game.id, multiplayer: game.multiplayer, \
              last_played_at: game.last_played_at, \
              publish_date: game.publish_date }

    file = File.size('./data/games.json').zero? ? [] : JSON.parse(File.read('./data/games.json'))
    file.push(store)
    File.write('./data/games.json', JSON.pretty_generate(file))
  end

  # save author
  def save_author(author)
    store = { id: author.id, first_name: author.first_name, last_name: author.last_name }

    file = File.size('./data/authors.json').zero? ? [] : JSON.parse(File.read('./data/authors.json'))
    file.push(store)
    File.write('./data/authors.json', JSON.pretty_generate(file))
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
end

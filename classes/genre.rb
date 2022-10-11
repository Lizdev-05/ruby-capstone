require 'securerandom'


class Genre
    attr_accessor :name
    attr_reader :id, :item
    
    def initialize(id, name)
        @id = id || SecureRandom.uuid
        @name = name
        @item = []
    end

    def add_item(item)
        @item << item
        item.genre = self
    end
end
require 'securerandom'


class Genre
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
require 'securerandom'


class Genre
    def initialize(id, name)
        @id = id || SecureRandom.uuid
        @name = name
        @item = []
    end
end
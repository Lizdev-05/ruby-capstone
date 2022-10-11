require 'securerandom'
class Item 
    attr_accessor :genre, :author, :source, :label, :publish_date
    attr_reader :id

    def initialize (id, genre, author, source, label, publish_date, archived: boolean)
        @id = id || SecureRandom.uuid
        @genre = genre
        @author = author
        @source = source
        @label = label
        @publish_date = publish_date
        @archived = archived
    end

    def move_to_archive
        @archived = can_be_archived?
    end

    private 
    def can_be_archived?
       # return true if publish_date is older than 10 years
        if publish_date > 10
            return true
        end
    end
 
end
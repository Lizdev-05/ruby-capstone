require './item.rb'

class Music < Item
  def initialize(date, on_sportify)
    super(date, archived: archived)
    @on_sportify = on_sportify
  end

  def can_be_archived?
    super && @on_sportify = true
  end
end
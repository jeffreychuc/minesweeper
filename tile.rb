class Tile

  attr_accessor :fringe, :state, :bomb

  def initialize(bomb=false)
    @bomb = bomb
    @fringe = 0
    @hidden = true
  end

end

class Tile

  attr_accessor :fringe, :state, :bomb 

  def initialize(bomb=false)
    @bomb = bomb
    @fringe = nil
    @hidden = true
  end

end

class Tile

  attr_accessor :fringe, :state, :bomb, :flag, :hidden 

  def initialize(bomb=false)
    @bomb = bomb
    @flag = false
    @fringe = 0
    @hidden = true
  end

end

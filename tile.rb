class Tile

  attr_accessor :fringe, :state, :bomb, :flag, :hidden, :explode

  def initialize(bomb=false)
    @explode = false
    @bomb = bomb
    @flag = false
    @fringe = 0
    @hidden = true
  end

end

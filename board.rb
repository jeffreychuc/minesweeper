require_relative 'tile'
class Board

  def initialize
    @size = { l: 9, w: 9 }
    @grid = Array.new(9){Array.new(9){Tile.new}}
    @lose = false
    populate_bombs
    @non_bombs = find_non_bombs
    set_fringe
  end

  def win?
    @non_bombs
  end

  def find_non_bombs
    res = []
    @grid.each do |row|
      res.concat(row.select{|tile| !tile.bomb})
    end
    res
  end

  def over?
    win? || @lose
  end

  def render
  end

  def populate_bombs
    10.times do
      pos = [rand(0..8),rand(0..8)]
      while self[pos].bomb
        pos = [rand(0..8),rand(0..8)]
      end
      self[pos].bomb = true
    end
  end

  def [](pos)
    @grid[pos[0]][pos[1]]
  end

  def set_fringe

  end
end

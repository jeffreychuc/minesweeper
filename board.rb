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

  def debug_render
    @grid.each do |row|
      row.each do |tile|
        print "B " if tile.bomb
        print "#{tile.fringe}" if !tile.bomb
      end
      print "\n"
    end
  end

  def populate_bombs
    10.times do
      pos = [rand(0..8),rand(0..8)]
      while self[pos].bomb
        pos = [rand(0..8),rand(0..8)]
      end
      self[pos].bomb = true
      set_fringe(pos)


    end
  end

  def [](pos)
    @grid[pos[0]][pos[1]]
  end



  def set_fringe(pos)
    start = [pos[0]-1, pos[1]-1]
    (0..3).each do |row_offset|
      (0..3).each do |col_offset|
        row_idx = row_offset + start[0]
        col_idx = col_offset + start[1]
        if (row_idx>=0 and row_idx<9) and (col_idx>=0 and col_idx<9)
          @grid[row_idx][col_idx].fringe += 1
        end
      end
    end
  end

end


=begin
  pos = [0,0]
  SIGMAS [-1, -1], [1,1 ]

  neighbors = []
  SIGMAS.each do |sigma|
    if pos[0]+sigma[0]>=0 pos[0]+sigma[0]<9
  end
=end

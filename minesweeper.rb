require_relative 'board'
require_relative 'tile'

class Minesweeper
  def initialize
    @board = Board.new
  end

  def run
    until @board.over?
      @board.render
      @board.debug_render
      play_turn
    end
    @board.render
    if @board.lose
      puts "sucks to suck"
    else
      puts "congraterationssss! a winner is u"
    end
  end

  def play_turn
    puts "What would you like to do? [f]lag [g]uess"
    action = gets.chomp
    puts "What position would you like this to be done on?"
    pos = gets.chomp.split(',').map { |e| e.to_i }
    do_action(action, pos)
  end

  def do_action(action, pos)
    case action
    when "f"
      @board[pos].flag = true
    when "g"
      if @board[pos].bomb
        @board[pos].explode = true
        @board.set_visible
        # run set all visble
        @board.lose = true
      else
        @board[pos].hidden = false
      end
    end
  end

end

game = Minesweeper.new
game.run

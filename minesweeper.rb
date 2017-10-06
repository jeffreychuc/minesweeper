require_relative 'board'
require_relative 'tile'

class Minesweeper
  def initialize
    @board = Board.new
  end

  def run
    until @board.over?
      @board.render
      play_turn
    end
    #display won message
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
        @board.lose = true
      else
        @board[pos].hidden = false
      end
    end
  end
end

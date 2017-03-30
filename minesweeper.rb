require_relative 'board.rb'
require_relative 'player.rb'
require 'byebug'
class Minesweeper

  def initialize(board, player)
    @board = board
    @player = player
  end

  def guess
  end

  def check_guess
  end

  def flag
  end

  def won?
  end

  def run
  end

  def play_turn
  end

  def lost?
  end

  def game_over?
  end

end

if __FILE__ = $PROGRAM_NAME
  game = Minesweeper.new(Board.random_board, Player.new("C"))
end

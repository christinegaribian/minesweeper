require_relative 'board.rb'
require_relative 'player.rb'
require 'byebug'
class Minesweeper

  def initialize(board, player)
    @board = board
    @player = player
  end

  def run
    play_turn until game_over?
  end

  def play_turn
    @board.render

    move = @player.get_move
    pos = @player.get_pos

    handle_turn(move, pos)
  end

  def handle_turn(move, pos)
    if move == "f"
      @board[pos].flag
    else
      @board[pos].reveal
    end
  end

  def lost?
    @board.lost?
  end

  def won?
    @board.won?
  end

  def game_over?
    won? || lost?
  end

end

if __FILE__ == $PROGRAM_NAME
  game = Minesweeper.new(Board.random_board, Player.new("C"))
end

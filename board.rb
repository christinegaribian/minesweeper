require_relative 'tile.rb'
NUM_BOMBS = 10
class Board
  def self.from_file(filename)

  end

  def self.random_board
    #TODO calls populate
    new_board = Array.new(9) { Array.new(9) }
    Board.new(new_board.populate)
  end

  def initialize(grid = self.random_board)
    @grid = grid
  end


  def lost?
    @grid.any? do |row|
      row.any? do |tile|
        tile.visible && tile.has_bomb
      end
    end
  end

  def won?
    @grid.all? do |row|
      row.all? do |tile|
        tile.revealed || tile.has_bomb
      end
    end
  end

  def populate
    options = []
    (9 * 9 - NUM_BOMBS).times do
      options << Tile.new
    end

    NUM_BOMBS.times do
      options << Tile.new(true)
    end

    options.shuffle!

    self.map! do |row|
      row.map! do |tile|
        options.pop
      end
    end

    self
  end

  def render
  end

  def grab_fringe
  end

  def check_fringe
  end

end

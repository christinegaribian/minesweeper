require_relative 'tile.rb'

class Board
  def self.from_file(filename)

  end

  def self.random_board
    #TODO calls populate
  end

  def initialize(grid = self.random_board)
    @grid = grid
  end

  def populate
  end

  def render
  end

  def grab_fringe
  end

  def check_fringe
  end

end

require_relative 'tile.rb'
NUM_BOMBS = 10
class Board
  def self.from_file(filename)

  end

  def self.random_board
    #TODO calls populate
    new_board = Array.new(9) { Array.new(9) }
    Board.new(Board.populate(new_board))
  end

  def initialize(grid = self.random_board)
    @grid = grid
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos, value)
    x, y = pos
    @grid[x][y] = value
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
        tile.visible || tile.has_bomb
      end
    end
  end

  def self.populate(array)
    options = []
    (9 * 9 - NUM_BOMBS).times do
      options << Tile.new
    end

    NUM_BOMBS.times do
      options << Tile.new(true)
    end

    options.shuffle!

    array.map! do |row|
      row.map! do |tile|
        options.pop
      end
    end

    array
  end

  def render
    puts "    " + (0..8).to_a.join(" ")
    @grid.each_with_index do |row, idx|
      puts "#{idx} | #{row.map{ |x| x.value }.join(" ")}"
    end

  end

  def grab_fringe(pos)
    x, y = pos
    x_range = (x-1..x+1).to_a.select {|val| val.between?(0,8)}
    y_range = (y-1..y+1).to_a.select {|val| val.between?(0,8)}

    new_pos = []
    x_range.each do |num1|
      y_range.each do |num2|
        new_pos << [num1, num2]
      end
    end

    remove_bad_neighbors(new_pos)
  end

  def remove_bad_neighbors(pos_array)
    neighbors = pos_array.reject do |pos|
      tile = @board[pos]
      tile.visible || tile.bomb
    end
    neighbors
  end

  def check_fringe
  end

end

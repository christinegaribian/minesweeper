class Tile
  attr_reader :has_bomb, :visible, :has_flag

  def initialize(bomb = false)
    @visible = false
    @has_bomb = bomb
    @has_flag = false
  end

  def reveal
    @visible = true
    # TODO what if bomb
  end

  def flag
    @has_flag = !@has_flag
  end
end

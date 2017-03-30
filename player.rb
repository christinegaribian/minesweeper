class Player
  def initialize(name)
    @name = name
  end

  def get_move_input
    puts "Do you want to guess or flag? (g/f): "
    print "> "
    input = gets.chomp
  end

  def get_move
    move = nil
    until valid_move?(move)
      move = get_move_input
    end

    move
  end

  def get_pos_input
    puts "What position would you like to guess?"
    print "> "
    parse_pos(gets.chomp)
  end

  def get_pos
    pos = nil
    until valid_pos?(pos)
      pos = get_pos_input
    end

    pos
  end

  def valid_move?(move)
    move == "g" || move == "f"
  end

  def valid_pos?(pos)
    pos.all? { |el| el.between?(0,8) }
  end

  def parse_pos(pos)
    pos.split(",").map(&:to_i)
  end
end

class Player
  # Initializes a new player with her/his name.
  #
  # You will have to create a board in there and randomize the
  # positioning of your ships on the board.
  
  SHIPS = [5, 4, 3, 2, 2, 1, 1]

  attr_reader :name

  def initialize(name)
    @name = name
    @board = Board.new(self)

  end

  def board
    @board
  end

  # def board_randomize(board)
  #   i = 0
  #   while i < SHIPS[i]
  #     s = starting_point




  #     i += 1
  #   end
  # end

  def starting_point
    board.field.keys.sample
  end

  def hit_wall_on_bottom?(size) 
    return false if size == 1 
    starting_point.slice(/\d+/).to_i + size - 1 <= 10
  end

  def hit_wall_on_right?(size)
    return false if size == 1
    return "j".bytes.first - starting_point.slice(0).bytes.first + 1 <= size 
  end


  
  # Tells us if there are still ships that have not been hit
  # on her/his board.
  def has_ships_still_floating?

  end
  
  # Shoots at the opponents board.
  def shoot(at_coordinates, opponent_board)
    opponent_board.register_shot(at_coordinates)
  end

end
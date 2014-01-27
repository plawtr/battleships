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
    # self.board = board.fetch(:board, DEFAULT)

  end

  def board
    @board
  end

  def board_randomize(board)
    # positions = []
    i = 0
    while i < SHIPS[i]
      # positions << @board[rand(0..9)].sample(ships[i])  # @board[rand(0..9)].sample(ships[i]).map { |x| x.replace("s")}
      s = starting_point




      i += 1
    end
  end

  def starting_point
    board.field.keys[rand(0..99)]
  end

  def hit_wall?

    

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
class Player
  # Initializes a new player with her/his name.
  #
  # You will have to create a board in there and randomize the
  # positioning of your ships on the board.
  
  attr_reader :name

  def initialize(name, board = [])
    @name = name
    @board ||= board
    # self.board = board.fetch(:board, DEFAULT)

  end

  def board(board)
    @board = board.rows
  end

  def board_randomize
    ships = [5, 4, 3, 2, 2, 1, 1]
    positions = []
    i = 0
    while i < ships[i]
      positions << @board[rand(0..9)].sample(ships[i])
      i += 1
    end
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
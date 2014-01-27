class Player
  # Initializes a new player with her/his name.
  #
  # You will have to create a board in there and randomize the
  # positioning of your ships on the board.
  
  SHIPS = [5, 4, 3, 2, 2, 1, 1]

  attr_accessor :name, :board, :start, :direction

  def initialize(name)
    @name = name
    @board = Board.new(self)
    start = starting_point
    direction = direction_choice
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

  def direction_choice
    ["vertical", "horizontal"].sample
  end

  def hit_wall_on_bottom?(size) 
    return false if size == 1 
    start.slice(/\d+/).to_i + size - 1 <= 10
  end

  def hit_wall_on_right?(size)
    return false if size == 1
    return "j".bytes.first - start.slice(0).bytes.first + 1 <= size 
  end

  def intercepts_bottom?(size)
    return true if board.field[start] == "s" 
    return false if size == 1 && board.field[start] == ""
    !((0..size).map{|x| board.field[start.slice(0)+(start.slice(1).to_i+x).to_s] }.all?{|x| x.empty? })
  end

  # TODO - intercepts_right?


  def place_ship(size)
    if direction == "horizontal" # check intercepts_right? hit wall right? if ok, place, else new starting postiion, new direction
    if direction == "vertical" # check intercepts bottom? hit wall bottom? if ok, place. else new postion, direction
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
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
    @start = starting_point
    @direction = direction_choice
  end

  def starting_point
    self.board.field.keys.sample
  end

  def direction_choice
    ["vertical", "horizontal"].sample
  end

  def hit_wall_on_bottom?(size) 
    return false if size == 1 
    start.slice(/\d+/).to_i + size - 1 > 10
  end

  def hit_wall_on_right?(size)
    return false if size == 1
    return "j".bytes.first - start.slice(0).bytes.first + 1 <= size 
  end

  def intersect_bottom?(size)
    return true if self.board.field[start] == "s" 
    return false if size == 1 && self.board.field[start] == ""
    !((0..size-1).map{|x| self.board.field[start.slice(0)+(start.slice(/\d+/).to_i+x).to_s] }.all?{|x| x.empty? })
  end

  def intersect_right?(size)
    return true if self.board.field[start] == "s" 
    return false if size == 1 && self.board.field[start] == ""
    !((0..size-1).map{|x| self.board.field[(start.slice(0).ord+x).chr+start.slice(/\d+/)] }.all?{|x| x.empty? }) 
  end

  def try_again(size)

    place_ship(size)
  end

  def place_ship(size)

    return false if self.board.field[start] == "s" 
    if size == 1
      self.board.field[start] = "s" 
      return true
    end 

    # check intercepts_right? hit wall right? if ok, place, else new starting postiion, new direction
    if direction == "horizontal" 
      return false if hit_wall_on_right?(size) || intersect_right?(size)
      (0..size-1).each{|x| self.board.field[(start.slice(0).ord+x).chr+start.slice(1)] = "s" }
    end

    # check intercepts bottom? hit wall bottom? if ok, place. else new postion, direction    
    if direction == "vertical" 
      return false if hit_wall_on_bottom?(size) || intersect_bottom?(size)
      (0..size-1).each{|x| self.board.field[start.slice(0)+(start.slice(/\d+/).to_i+x).to_s] = "s" }
    end

    return true

  end
  
  def place_all_ships
    SHIPS.each do |size| 
      puts "placing #{size}"
      n = 0 
      while !place_ship(size) && n<100
        puts "placing #{size}"
        puts "placed #{self.board.field.values.select{|x| x == "s"}.size}"
        n+=1
        start = starting_point
        direction = direction_choice 
      end
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
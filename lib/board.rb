class Board
 
  def initialize player
    @player = player
    @field = create_field

  end
  
  def create_field
    field = {}
    keys = ("a".."i").to_a << "l"
    keys.each { |k| (1..10).each {|no| field[k+no.to_s] = ''}  }
    field 
  end


  def owner
    @player.name
  end
  
  # This method should register the shot at the coordinates passed
  # hitting a ship or
  # just hitting the water.
  def register_shot at_coordinates  
  end
  
  # This method returns an array containing 10 arrays with 10 
  # elements each where:
  # - an empty string ('') denotes an empty space in the grid
  # - an 'o' denotes a shot in the water
  # - an 'x' denotes a hit on a ship
  # - an 's' denotes a ship
  # you can change the representations as you please, but make sure
  # that you have
  # four different types
  def rows
    field = @field.dup
    a = [[]]*10
    (0..9).each {|i| (0..9).each{|j| a[i][j] = field.shift.last }}
    return a
  end
  
  # This method returns an array containing 10 arrays with 10
  # elements each (as in rows) replacing the ships with an empty
  # string ('') so that your opponent cannot see your ships.
  def opponent_view
  end
end

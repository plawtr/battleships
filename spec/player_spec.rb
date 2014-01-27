require_relative "../lib/player"
require_relative "../lib/board"

describe Player do

	# let(:player) {Player.new}
	
	it "should get user name" do  
		player = Player.new("John")
		expect(player.name).to eq("John")
	end

	# it "should return a board" do  
	# 	board = double :board
	# 	player = Player.new("John")
	# 	expect(board).to receive(:create_field)
	# 	player.board(board)
	# end

	# it "should randomize the positioning of ships" do  
	# 	# board = double :board
	# 	# ship = double :ship
	# 	# board = Board.new
	# 	player = Player.new("John")
	# 	expect(board).to receive(:rows)
	# 	player.board(board)
	# 	player.board_randomize
	# 	expect(board).to have_ships
	# end

	it "should choose random starting position of ships" do  
		player = Player.new("John")
		board = Board.new(player)
		expect((board.field.keys).include?(player.starting_point)).to be_true
	end




	it "should shoot at the opponents board" do  
		board = double :board
		player = Player.new("John")
		expect(board).to receive(:register_shot)
		player.shoot("a4", board)
	end

	# it "should have ships floating" do 

	# end

end
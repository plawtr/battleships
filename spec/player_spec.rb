require_relative "../lib/player"

describe Player do

	let(:player) {Player.new}
	
	it "should get user name" do  
		player = Player.new("John")
		expect(player.name).to eq("John")
	end

	it "should return a board" do  
		board = double :board
		player = Player.new("John")
		expect(board).to receive(:rows)
		player.board(board)
	end

	# it "should randomize the positioning of ships" do  
	# 	board = double :board
	# 	ship = double :ship
	# 	expect(board)
	# 	player.randomize
	# end

end
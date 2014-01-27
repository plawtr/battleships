require_relative "../lib/player"
require_relative "../lib/board"

describe Player do
	let(:player) { Player.new("Joe") }
	let(:board) { Board.new(player) }

	it "should get user name" do  
		expect(player.name).to eq("Joe")
	end

	it "should choose random starting position of ships" do  
		expect((board.field.keys).include?(player.starting_point)).to be_true
	end

	it "should check if ship hits bottom of board" do
		player.stub(:starting_point).and_return("j9")
		expect(player.hit_wall_on_bottom?(1)).to be_false
		expect(player.hit_wall_on_bottom?(2)).to be_true
	end


	# it "should shoot at the opponents board" do  
	# 	board = double :board
	# 	player = Player.new("John")
	# 	expect(board).to receive(:register_shot)
	# 	player.shoot("a4", board)
	# end

	# it "should have ships floating" do 

	# end

end
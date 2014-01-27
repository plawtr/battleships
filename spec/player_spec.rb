require_relative "../lib/player"
require_relative "../lib/board"

describe Player do
	let(:player) { Player.new("Joe") }
	let(:board) { Board.new(player) }

	it "should get user name" do  
		expect(player.name).to eq("Joe")
	end

	it "should choose random starting position for ships" do  
		expect((board.field.keys).include?(player.starting_point)).to be_true
	end

	it "should choose random direction for the placement of the ships" do
		expect((["vertical", "horizontal"]).include?(player.direction_choice)).to be_true
	end

	it "should check if ship would hit the bottom of the board" do
		player.start = "j9"
		expect(player.hit_wall_on_bottom?(1)).to be_false
		expect(player.hit_wall_on_bottom?(2)).to be_true
	end

	it "should check if the ship would hit the  right side of the board" do
		player.start = "j5"
		expect(player.hit_wall_on_right?(1)).to be_false
		expect(player.hit_wall_on_right?(2)).to be_true
	end

	it "should check if the ship intersect other ships to the bottom" do
		player.start = "j5"
		expect(player.intersect_bottom?(5)).to be_false
		player.board.field["j6"] = "s"
		expect(player.intersect_bottom?(5)).to be_true
	end

	it "should check if the ship intersects other ships to the right" do
		player.start = "a5"
		expect(player.intersect_right?(5)).to be_false
		player.board.field["b5"] = "s"
		expect(player.intersect_right?(5)).to be_true
	end

	it "should place 5 size ship on the board vertically" do
		player.start = "j5"
		player.direction = "vertical"
		player.place_ship(5)
		expect(player.board.field).to eq({"a1"=>"", "a2"=>"", "a3"=>"", "a4"=>"", "a5"=>"", "a6"=>"", "a7"=>"", "a8"=>"", "a9"=>"", "a10"=>"", "b1"=>"", "b2"=>"", "b3"=>"", "b4"=>"", "b5"=>"", "b6"=>"", "b7"=>"", "b8"=>"", "b9"=>"", "b10"=>"", "c1"=>"", "c2"=>"", "c3"=>"", "c4"=>"", "c5"=>"", "c6"=>"", "c7"=>"", "c8"=>"", "c9"=>"", "c10"=>"", "d1"=>"", "d2"=>"", "d3"=>"", "d4"=>"", "d5"=>"", "d6"=>"", "d7"=>"", "d8"=>"", "d9"=>"", "d10"=>"", "e1"=>"", "e2"=>"", "e3"=>"", "e4"=>"", "e5"=>"", "e6"=>"", "e7"=>"", "e8"=>"", "e9"=>"", "e10"=>"", "f1"=>"", "f2"=>"", "f3"=>"", "f4"=>"", "f5"=>"", "f6"=>"", "f7"=>"", "f8"=>"", "f9"=>"", "f10"=>"", "g1"=>"", "g2"=>"", "g3"=>"", "g4"=>"", "g5"=>"", "g6"=>"", "g7"=>"", "g8"=>"", "g9"=>"", "g10"=>"", "h1"=>"", "h2"=>"", "h3"=>"", "h4"=>"", "h5"=>"", "h6"=>"", "h7"=>"", "h8"=>"", "h9"=>"", "h10"=>"", "i1"=>"", "i2"=>"", "i3"=>"", "i4"=>"", "i5"=>"", "i6"=>"", "i7"=>"", "i8"=>"", "i9"=>"", "i10"=>"", "j1"=>"", "j2"=>"", "j3"=>"", "j4"=>"", "j5"=>"s", "j6"=>"s", "j7"=>"s", "j8"=>"s", "j9"=>"s", "j10"=>""})
	end

	it "should place 5 size ship on the board horizontally" do
		player.start = "a5"
		player.direction = "horizontal"
		player.place_ship(5)
		expect(player.board.field).to eq({"a1"=>"", "a2"=>"", "a3"=>"", "a4"=>"", "a5"=>"s", "a6"=>"", "a7"=>"", "a8"=>"", "a9"=>"", "a10"=>"", "b1"=>"", "b2"=>"", "b3"=>"", "b4"=>"", "b5"=>"s", "b6"=>"", "b7"=>"", "b8"=>"", "b9"=>"", "b10"=>"", "c1"=>"", "c2"=>"", "c3"=>"", "c4"=>"", "c5"=>"s", "c6"=>"", "c7"=>"", "c8"=>"", "c9"=>"", "c10"=>"", "d1"=>"", "d2"=>"", "d3"=>"", "d4"=>"", "d5"=>"s", "d6"=>"", "d7"=>"", "d8"=>"", "d9"=>"", "d10"=>"", "e1"=>"", "e2"=>"", "e3"=>"", "e4"=>"", "e5"=>"s", "e6"=>"", "e7"=>"", "e8"=>"", "e9"=>"", "e10"=>"", "f1"=>"", "f2"=>"", "f3"=>"", "f4"=>"", "f5"=>"", "f6"=>"", "f7"=>"", "f8"=>"", "f9"=>"", "f10"=>"", "g1"=>"", "g2"=>"", "g3"=>"", "g4"=>"", "g5"=>"", "g6"=>"", "g7"=>"", "g8"=>"", "g9"=>"", "g10"=>"", "h1"=>"", "h2"=>"", "h3"=>"", "h4"=>"", "h5"=>"", "h6"=>"", "h7"=>"", "h8"=>"", "h9"=>"", "h10"=>"", "i1"=>"", "i2"=>"", "i3"=>"", "i4"=>"", "i5"=>"", "i6"=>"", "i7"=>"", "i8"=>"", "i9"=>"", "i10"=>"", "j1"=>"", "j2"=>"", "j3"=>"", "j4"=>"", "j5"=>"", "j6"=>"", "j7"=>"", "j8"=>"", "j9"=>"", "j10"=>""})
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
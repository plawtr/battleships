require_relative "../lib/board"



describe Board do 

let(:board) {Board.new("player")}

	#it "should register the given the coords" do
	it "should initialize the board of empty values" do

			expect(board.create_field).to eq({"a1"=>"", "a2"=>"", "a3"=>"", "a4"=>"", "a5"=>"", "a6"=>"", "a7"=>"", "a8"=>"", "a9"=>"", "a10"=>"", "b1"=>"", "b2"=>"", "b3"=>"", "b4"=>"", "b5"=>"", "b6"=>"", "b7"=>"", "b8"=>"", "b9"=>"", "b10"=>"", "c1"=>"", "c2"=>"", "c3"=>"", "c4"=>"", "c5"=>"", "c6"=>"", "c7"=>"", "c8"=>"", "c9"=>"", "c10"=>"", "d1"=>"", "d2"=>"", "d3"=>"", "d4"=>"", "d5"=>"", "d6"=>"", "d7"=>"", "d8"=>"", "d9"=>"", "d10"=>"", "e1"=>"", "e2"=>"", "e3"=>"", "e4"=>"", "e5"=>"", "e6"=>"", "e7"=>"", "e8"=>"", "e9"=>"", "e10"=>"", "f1"=>"", "f2"=>"", "f3"=>"", "f4"=>"", "f5"=>"", "f6"=>"", "f7"=>"", "f8"=>"", "f9"=>"", "f10"=>"", "g1"=>"", "g2"=>"", "g3"=>"", "g4"=>"", "g5"=>"", "g6"=>"", "g7"=>"", "g8"=>"", "g9"=>"", "g10"=>"", "h1"=>"", "h2"=>"", "h3"=>"", "h4"=>"", "h5"=>"", "h6"=>"", "h7"=>"", "h8"=>"", "h9"=>"", "h10"=>"", "i1"=>"", "i2"=>"", "i3"=>"", "i4"=>"", "i5"=>"", "i6"=>"", "i7"=>"", "i8"=>"", "i9"=>"", "i10"=>"", "j1"=>"", "j2"=>"", "j3"=>"", "j4"=>"", "j5"=>"", "j6"=>"", "j7"=>"", "j8"=>"", "j9"=>"", "j10"=>""})

		expect(board.rows).to eq([["", "", "", "", "", "", "", "", "", ""], ["", "", "", "", "", "", "", "", "", ""], ["", "", "", "", "", "", "", "", "", ""], ["", "", "", "", "", "", "", "", "", ""], ["", "", "", "", "", "", "", "", "", ""], ["", "", "", "", "", "", "", "", "", ""], ["", "", "", "", "", "", "", "", "", ""], ["", "", "", "", "", "", "", "", "", ""], ["", "", "", "", "", "", "", "", "", ""], ["", "", "", "", "", "", "", "", "", ""]] )

	end

	it "should register the shot on an empty board" do
		board.register_shot("a1")
		expect(board.rows).to eq([["o", "", "", "", "", "", "", "", "", ""], ["", "", "", "", "", "", "", "", "", ""], ["", "", "", "", "", "", "", "", "", ""], ["", "", "", "", "", "", "", "", "", ""], ["", "", "", "", "", "", "", "", "", ""], ["", "", "", "", "", "", "", "", "", ""], ["", "", "", "", "", "", "", "", "", ""], ["", "", "", "", "", "", "", "", "", ""], ["", "", "", "", "", "", "", "", "", ""], ["", "", "", "", "", "", "", "", "", ""]])
	end

	it "should register the shot on a non-empty board" do
		
		board.field["a1"] = "s"

		board.register_shot("a1")


		expect(board.rows).to eq([["x", "", "", "", "", "", "", "", "", ""], ["", "", "", "", "", "", "", "", "", ""], ["", "", "", "", "", "", "", "", "", ""], ["", "", "", "", "", "", "", "", "", ""], ["", "", "", "", "", "", "", "", "", ""], ["", "", "", "", "", "", "", "", "", ""], ["", "", "", "", "", "", "", "", "", ""], ["", "", "", "", "", "", "", "", "", ""], ["", "", "", "", "", "", "", "", "", ""], ["", "", "", "", "", "", "", "", "", ""]])
	end

	it "should validate the coordinates" do
		expect{ board.register_shot("blah")}.to raise_error(RuntimeError)
	end

	it "should create an opponent view" do

		board.field["a1"] = "s"
		board.field["a2"] = "s"
		board.register_shot("a2")
		board.register_shot("a3")
		expect(board.rows).to eq([["s", "x", "o", "", "", "", "", "", "", ""], ["", "", "", "", "", "", "", "", "", ""], ["", "", "", "", "", "", "", "", "", ""], ["", "", "", "", "", "", "", "", "", ""], ["", "", "", "", "", "", "", "", "", ""], ["", "", "", "", "", "", "", "", "", ""], ["", "", "", "", "", "", "", "", "", ""], ["", "", "", "", "", "", "", "", "", ""], ["", "", "", "", "", "", "", "", "", ""], ["", "", "", "", "", "", "", "", "", ""]])
		expect(board.opponent_view).to eq([["", "x", "o", "", "", "", "", "", "", ""], ["", "", "", "", "", "", "", "", "", ""], ["", "", "", "", "", "", "", "", "", ""], ["", "", "", "", "", "", "", "", "", ""], ["", "", "", "", "", "", "", "", "", ""], ["", "", "", "", "", "", "", "", "", ""], ["", "", "", "", "", "", "", "", "", ""], ["", "", "", "", "", "", "", "", "", ""], ["", "", "", "", "", "", "", "", "", ""], ["", "", "", "", "", "", "", "", "", ""]])
	end

end
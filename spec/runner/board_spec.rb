describe Board do

  let(:black)  { Negro.new }
  let(:blue)   { Azul.new }
  let(:green)  { Verde.new }
  let(:red)    { Rojo.new }
  let(:colors) { [blue, black, red, green] }

  it "can be created with a number of rows and columns" do
    board = Board.new 8, 5
    expect(board.rows).to eq(8)
    expect(board.columns).to eq(5)
  end

  it "should have cells in every position" do
    board = Board.new 3, 3

    board.each_cell { |cell| expect(cell).to be_a(Cell) }
  end

  it "should access cells in a x&y dimension" do
    board = Board.new 3, 5

    3.times do |x|
      5.times do |y|
        expect(board.cell_at(x, y)).to be
      end
    end
  end

  it "should raise errors if it is accessed out of the bounds" do
    board = Board.new 9, 6

    expect { board.cell_at(9, 4) }.to raise_error(OutOfBoardError)
    expect { board.cell_at(3, 6) }.to raise_error(OutOfBoardError)
    expect { board.cell_at(-1, 2) }.to raise_error(OutOfBoardError)
    expect { board.cell_at(8, -1) }.to raise_error(OutOfBoardError)
  end

  it "should put balls in a given position" do
    board = Board.new 5, 5

    2.times { board.put 0, 0, blue }
    10.times { board.put 2, 3, red }

    expect(board.are_there_balls?(0, 0, blue)).to be true
    expect(board.number_of_balls(0, 0, blue)).to eq(2)
    expect(board.are_there_balls?(2, 3, red)).to be true
    expect(board.number_of_balls(2, 3, red)).to eq(10)
  end

  it "should put and take out balls in a given position" do
    board = Board.new 2, 2

    3.times { board.put 1, 1, green }
    3.times { board.take_out 1, 1, green }

    expect(board.are_there_balls?(1, 1, green)).to be false
  end

  it "should empty the entire board" do
    board = Board.new 3, 4
    board.each_cell { |cell| cell.put colors.sample }

    board.empty!

    board.each_cell do |cell|
      colors.each do |color|
        expect(cell.are_there_balls?(color)).to be false
      end
    end
  end

  it "should be empty if there are no balls" do
    board = Board.new 3, 4
    expect(board.empty?).to be true
  end

  it "should not be empty if there are balls" do
    board = Board.new 3, 4
    board.put 0, 0, black
    expect(board.empty?).to be false
  end

end

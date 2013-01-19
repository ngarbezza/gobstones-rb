require 'gobstones/runner/out_of_board_error'

describe Board do

  let(:black)  { Negro.new }
  let(:blue)   { Azul.new }
  let(:green)  { Verde.new }
  let(:red)    { Rojo.new }
  let(:colors) { [blue, black, red, green] }

  it "can be created with a number of rows and columns" do
    board = Board.new 8, 5
    board.rows.should == 8
    board.columns.should == 5
  end

  it "should have cells in every position" do
    board = Board.new 3, 3

    board.each_cell { |cell| cell.should be_a(Cell) }
  end

  it "should access cells in a x&y dimension" do
    board = Board.new 3, 5

    3.times do |x|
      5.times do |y|
        board.cell_at(x, y).should be
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

    board.are_there_balls?(0, 0, blue).should be_true
    board.number_of_balls(0, 0, blue).should == 2
    board.are_there_balls?(2, 3, red).should be_true
    board.number_of_balls(2, 3, red).should == 10
  end

  it "should put and take out balls in a given position" do
    board = Board.new 2, 2

    3.times { board.put 1, 1, green }
    3.times { board.take_out 1, 1, green }

    board.are_there_balls?(1, 1, green).should be_false
  end

  it "should empty the entire board" do
    board = Board.new 3, 4
    board.each_cell { |cell| cell.put colors.sample }

    board.empty!

    board.each_cell do |cell|
      colors.each do |color|
        cell.are_there_balls?(color).should be_false
      end
    end
  end

end

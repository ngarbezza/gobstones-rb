RSpec.describe Board do
  let(:colors) { [azul, negro, rojo, verde] }

  it 'can be created with a number of rows and columns' do
    board = described_class.new(8, 5)

    expect(board.rows).to eq(8)
    expect(board.columns).to eq(5)
  end

  it 'has cells in every position' do
    board = described_class.new(3, 3)

    board.each_cell { |cell| expect(cell).to be_a(Cell) }
  end

  it 'accesses cells in a x&y dimension' do
    board = described_class.new(3, 5)

    3.times do |x|
      5.times do |y|
        expect(board.cell_at(x, y)).to be
      end
    end
  end

  it 'raises errors if it is accessed out of the bounds' do
    board = described_class.new(9, 6)

    expect { board.cell_at(9, 4) }.to raise_error(OutOfBoardError)
    expect { board.cell_at(3, 6) }.to raise_error(OutOfBoardError)
    expect { board.cell_at(-1, 2) }.to raise_error(OutOfBoardError)
    expect { board.cell_at(8, -1) }.to raise_error(OutOfBoardError)
  end

  it 'puts balls in a given position' do
    board = described_class.new(5, 5)

    2.times { board.put 0, 0, azul }
    10.times { board.put 2, 3, rojo }

    expect(board.are_there_balls?(0, 0, azul)).to be(true)
    expect(board.number_of_balls(0, 0, azul)).to eq(2)
    expect(board.are_there_balls?(2, 3, rojo)).to be(true)
    expect(board.number_of_balls(2, 3, rojo)).to eq(10)
  end

  it 'puts and takes out balls in a given position' do
    board = described_class.new(2, 2)

    3.times { board.put 1, 1, verde }
    3.times { board.take_out 1, 1, verde }

    expect(board.are_there_balls?(1, 1, verde)).to be(false)
  end

  it 'clears the entire board' do
    board = described_class.new(3, 4)
    board.each_cell { |cell| cell.put colors.sample }

    board.empty!

    board.each_cell do |cell|
      colors.each do |color|
        expect(cell.are_there_balls?(color)).to be(false)
      end
    end
  end

  it 'is empty if there are no balls' do
    board = described_class.new(3, 4)

    expect(board.empty?).to be(true)
  end

  it 'is not empty if there are balls' do
    board = described_class.new(3, 4)
    board.put 0, 0, negro

    expect(board.empty?).to be(false)
  end
end

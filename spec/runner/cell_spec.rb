# frozen_string_literal: true

RSpec.describe Cell do
  subject(:cell) { described_class.new }

  it 'answers that there are no balls of a given color' do
    expect_no_balls(*colors, on: cell)
  end

  it 'answers that there are balls of a given color when adding some' do
    cell.put azul
    cell.put rojo

    expect_balls(azul, rojo, on: cell)
    expect_no_balls(verde, negro, on: cell)
  end

  it 'answers the number of balls of a given color' do
    5.times { cell.put verde }

    expect(cell.number_of_balls(azul)).to eq(0)
    expect(cell.number_of_balls(negro)).to eq(0)
    expect(cell.number_of_balls(rojo)).to eq(0)
    expect(cell.number_of_balls(verde)).to eq(5)
  end

  it 'allows to take out some balls' do
    5.times { cell.put azul }
    3.times { cell.take_out azul }

    expect(cell.are_there_balls?(azul)).to be(true)
    expect(cell.number_of_balls(azul)).to eq(2)
  end

  it "raises an error if it's not possible to take out balls" do
    expect { cell.take_out rojo }.to raise_error(EmptyCellError)
  end

  it 'fails passing something that is not a color' do
    expect { cell.put('not a color') }.to raise_error(/is not a color/)
    expect { cell.take_out(42) }.to raise_error(/is not a color/)
    expect { cell.are_there_balls?(Norte) }.to raise_error(/is not a color/)
    expect { cell.number_of_balls(nil) }.to raise_error(/is not a color/)
  end

  it 'clears its contents' do
    colors.each { |color| cell.put color }

    cell.empty!

    expect_no_balls(*colors, on: cell)
  end

  it "is empty if it doesn't have any balls" do
    expect(cell).to be_empty
  end

  it 'is not empty it it has some balls' do
    colors.each { |color| cell.put color }

    expect(cell).not_to be_empty
  end
end

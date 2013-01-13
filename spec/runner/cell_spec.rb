require 'gobstones/runner/empty_cell_error'

describe Cell do

  it "should answer that there are no balls of a given color" do
    cell = Cell.new

    cell.are_there_balls?(Azul).should be_false
    cell.are_there_balls?(Negro).should be_false
    cell.are_there_balls?(Rojo).should be_false
    cell.are_there_balls?(Verde).should be_false
  end

  it "should answer that there are balls of a given color when adding some" do
    cell = Cell.new

    cell.put Azul
    cell.put Rojo

    cell.are_there_balls?(Azul).should be_true
    cell.are_there_balls?(Negro).should be_false
    cell.are_there_balls?(Rojo).should be_true
    cell.are_there_balls?(Verde).should be_false
  end

  it "should answer the number of balls of a given color" do
    cell = Cell.new

    5.times { cell.put Verde }

    cell.number_of_balls(Azul).should == 0
    cell.number_of_balls(Negro).should == 0
    cell.number_of_balls(Rojo).should == 0
    cell.number_of_balls(Verde).should == 5
  end

  it "should allow to take out some balls" do
    cell = Cell.new

    5.times { cell.put Azul }
    3.times { cell.take_out Azul }

    cell.are_there_balls?(Azul).should be_true
    cell.number_of_balls(Azul).should == 2
  end

  it "should raise an error if it's not possible to take out balls" do
    cell = Cell.new

    expect { cell.take_out Rojo }.to raise_error(EmptyCellError)
  end

  it "should fail passing something that is not a color" do
    cell = Cell.new

    expect { cell.put("not a color") }.to raise_error
    expect { cell.take_out(42) }.to raise_error
    expect { cell.are_there_balls?(Norte) }.to raise_error
    expect { cell.number_of_balls(nil) }.to raise_error
  end

end

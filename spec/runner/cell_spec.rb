describe Cell do

  let(:black)  { Negro.new }
  let(:blue)   { Azul.new }
  let(:green)  { Verde.new }
  let(:red)    { Rojo.new }
  let(:colors) { [blue, black, red, green] }

  it "should answer that there are no balls of a given color" do
    cell = Cell.new

    cell.are_there_balls?(blue).should be_false
    cell.are_there_balls?(black).should be_false
    cell.are_there_balls?(red).should be_false
    cell.are_there_balls?(green).should be_false
  end

  it "should answer that there are balls of a given color when adding some" do
    cell = Cell.new

    cell.put blue
    cell.put red

    cell.are_there_balls?(blue).should be_true
    cell.are_there_balls?(black).should be_false
    cell.are_there_balls?(red).should be_true
    cell.are_there_balls?(green).should be_false
  end

  it "should answer the number of balls of a given color" do
    cell = Cell.new

    5.times { cell.put green }

    cell.number_of_balls(blue).should == 0
    cell.number_of_balls(black).should == 0
    cell.number_of_balls(red).should == 0
    cell.number_of_balls(green).should == 5
  end

  it "should allow to take out some balls" do
    cell = Cell.new

    5.times { cell.put blue }
    3.times { cell.take_out blue }

    cell.are_there_balls?(blue).should be_true
    cell.number_of_balls(blue).should == 2
  end

  it "should raise an error if it's not possible to take out balls" do
    cell = Cell.new

    expect { cell.take_out red }.to raise_error(EmptyCellError)
  end

  it "should fail passing something that is not a color" do
    cell = Cell.new

    expect { cell.put("not a color") }.to raise_error
    expect { cell.take_out(42) }.to raise_error
    expect { cell.are_there_balls?(Norte) }.to raise_error
    expect { cell.number_of_balls(nil) }.to raise_error
  end

  it "should empty its contents" do
    cell = Cell.new
    colors.each { |color| cell.put color }

    cell.empty!

    colors.each { |color| cell.are_there_balls?(color).should be_false }
  end

end
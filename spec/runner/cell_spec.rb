describe Cell do

  let(:black)  { Negro.new }
  let(:blue)   { Azul.new }
  let(:green)  { Verde.new }
  let(:red)    { Rojo.new }
  let(:colors) { [blue, black, red, green] }
  let(:cell)   { Cell.new }

  it "should answer that there are no balls of a given color" do
    expect(cell.are_there_balls?(blue)).to be false
    expect(cell.are_there_balls?(black)).to be false
    expect(cell.are_there_balls?(red)).to be false
    expect(cell.are_there_balls?(green)).to be false
  end

  it "should answer that there are balls of a given color when adding some" do
    cell.put blue
    cell.put red

    expect(cell.are_there_balls?(blue)).to be true
    expect(cell.are_there_balls?(black)).to be false
    expect(cell.are_there_balls?(red)).to be true
    expect(cell.are_there_balls?(green)).to be false
  end

  it "should answer the number of balls of a given color" do
    5.times { cell.put green }

    expect(cell.number_of_balls(blue)).to eq(0)
    expect(cell.number_of_balls(black)).to eq(0)
    expect(cell.number_of_balls(red)).to eq(0)
    expect(cell.number_of_balls(green)).to eq(5)
  end

  it "should allow to take out some balls" do
    5.times { cell.put blue }
    3.times { cell.take_out blue }

    expect(cell.are_there_balls?(blue)).to be true
    expect(cell.number_of_balls(blue)).to eq(2)
  end

  it "should raise an error if it's not possible to take out balls" do
    expect { cell.take_out red }.to raise_error(EmptyCellError)
  end

  it "should fail passing something that is not a color" do
    expect { cell.put("not a color") }.to raise_error
    expect { cell.take_out(42) }.to raise_error
    expect { cell.are_there_balls?(Norte) }.to raise_error
    expect { cell.number_of_balls(nil) }.to raise_error
  end

  it "should empty its contents" do
    colors.each { |color| cell.put color }

    cell.empty!

    colors.each { |color| expect(cell.are_there_balls?(color)).to be false }
  end

  it "should be empty if it doesn't have any balls" do
    expect(cell.empty?).to be true
  end

  it "should not be empty it it has some balls" do
    colors.each { |color| cell.put color }
    expect(cell.empty?).to be false
  end

end

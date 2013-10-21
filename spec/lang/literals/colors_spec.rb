describe "colors" do

  let(:all) { [Azul.new, Negro.new, Rojo.new, Verde.new] }

  it "should evaluate any color to self" do
    all.each { |color| expect(color.evaluate).to eq(color) }
  end

  it "should give the string representation" do
    expect(all.map(&:to_s)).to eq(['Azul', 'Negro', 'Rojo', 'Verde'])
  end

end
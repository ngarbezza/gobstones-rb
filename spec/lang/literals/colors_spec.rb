describe "colors" do

  let(:all) { [azul, negro, rojo, verde] }

  it "should evaluate any color to self" do
    all.each { |color| expect(color.evaluate).to eq(color) }
  end

  it "should give the string representation" do
    expect(all.map(&:to_s)).to eq(['Azul', 'Negro', 'Rojo', 'Verde'])
  end

end

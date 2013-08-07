describe "colors" do

  let(:all) { [Azul.new, Negro.new, Rojo.new, Verde.new] }

  it "should evaluate any color to self" do
    all.each { |color| color.evaluate.should == color }
  end

  it "should give the string representation" do
    all.map(&:to_s).should == ['Azul', 'Negro', 'Rojo', 'Verde']
  end

end

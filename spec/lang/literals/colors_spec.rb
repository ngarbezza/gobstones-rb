describe "colors" do

  it "should evaluate any color to self" do
    [Azul.new, Negro.new, Rojo.new, Verde.new].each do |color|
      color.evaluate.should == color
    end
  end

end

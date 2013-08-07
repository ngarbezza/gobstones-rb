describe ExecutionContext do

  let(:context) { ExecutionContext.new }

  describe "variables context" do

    it "should allow to set & get a variable" do
      color = Negro.new
      context.set "myColor", color

      context.get("myColor").should == color
    end

    it "should allow to set/get more than one variable" do
      dir = Norte.new
      bool = True.new

      context.set "dir", dir
      context.set "bool", bool

      context.get("dir").should == dir
      context.get("bool").should == bool
    end

    it "should raise an error when getting an undefined variable" do
      expect {
        context.get("undefined")
      }.to raise_error(UndefinedVariableError)
    end

  end

end


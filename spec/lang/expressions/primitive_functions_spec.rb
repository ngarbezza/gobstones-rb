describe "primitive functions" do

  let(:context) { ExecutionContext.new }
  let(:black) { Negro.new }

  describe "nroBolitas() function" do

    it "should evaluates correctly in a clean context" do
      NroBolitas.new(black).evaluate(context).should == 0.to_gbs_num
    end

    it "should evaluate correctly in a context with some data" do
      5.times { context.head.put black }
      NroBolitas.new(black).evaluate(context).should == 5.to_gbs_num
    end

  end

  describe "hayBolitas() function" do

    it "should evaluate correctly in a clean context" do
      HayBolitas.new(black).evaluate(context).should == false.to_gbs_bool
    end

    it "should evaluate correctly in a context with some data" do
      context.head.put black
      HayBolitas.new(black).evaluate(context).should == true.to_gbs_bool
    end

  end

end

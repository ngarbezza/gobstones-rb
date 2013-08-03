describe "primitive functions" do

  let(:context) { ExecutionContext.for double('GobstonesProgram') }
  let(:black) { Negro.new }
  let(:west) { Oeste.new }

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

  describe "puedeMover() function" do

    it "should evaluate correctly in a clean context" do
      PuedeMover.new(west).evaluate(context).should == false.to_gbs_bool
    end

    it "should evaluate correctly in a modified context" do
      context.head.move(Este.new)
      PuedeMover.new(west).evaluate(context).should == true.to_gbs_bool
    end

  end

  describe "siguiente() function" do

    it "should evaluate correctly for numbers" do
      Siguiente.new(15.to_gbs_num).evaluate.should == 16.to_gbs_num
    end

    it "should evaluate correctly for colors" do
      Siguiente.new(Azul.new).evaluate.should == Negro.new
      Siguiente.new(Negro.new).evaluate.should == Rojo.new
      Siguiente.new(Rojo.new).evaluate.should == Verde.new
      Siguiente.new(Verde.new).evaluate.should == Azul.new
    end

    it "should evaluate correctly for directions" do
      Siguiente.new(Norte.new).evaluate.should == Este.new
      Siguiente.new(Este.new).evaluate.should == Sur.new
      Siguiente.new(Sur.new).evaluate.should == Oeste.new
      Siguiente.new(Oeste.new).evaluate.should == Norte.new
    end

    it "should evaluate correctly for booleans" do
      Siguiente.new(True.new).evaluate.should == False.new
      Siguiente.new(False.new).evaluate.should == True.new
    end

  end

  describe "previo() function" do

    it "should evaluate correctly for numbers" do
      Previo.new(43.to_gbs_num).evaluate.should == 42.to_gbs_num
    end

    it "should evaluate correctly for colors" do
      Previo.new(Azul.new).evaluate.should == Verde.new
      Previo.new(Negro.new).evaluate.should == Azul.new
      Previo.new(Rojo.new).evaluate.should == Negro.new
      Previo.new(Verde.new).evaluate.should == Rojo.new
    end

    it "should evaluate correctly for directions" do
      Previo.new(Norte.new).evaluate.should == Oeste.new
      Previo.new(Este.new).evaluate.should == Norte.new
      Previo.new(Sur.new).evaluate.should == Este.new
      Previo.new(Oeste.new).evaluate.should == Sur.new
    end

    it "should evaluate correctly for booleans" do
      Previo.new(True.new).evaluate.should == False.new
      Previo.new(False.new).evaluate.should == True.new
    end

  end

  describe "opuesto() function" do

    it "should evaluate correctly for numbers" do
      Opuesto.new(23.to_gbs_num).evaluate.should == -23.to_gbs_num
      Opuesto.new(-42.to_gbs_num).evaluate.should == 42.to_gbs_num
    end

    it "should evaluate correctly for directions" do
      Opuesto.new(Norte.new).evaluate.should == Sur.new
      Opuesto.new(Este.new).evaluate.should == Oeste.new
      Opuesto.new(Sur.new).evaluate.should == Norte.new
      Opuesto.new(Oeste.new).evaluate.should == Este.new
    end

    it "should evaluate correctly for booleans" do
      Opuesto.new(True.new).evaluate.should == False.new
      Opuesto.new(False.new).evaluate.should == True.new
    end

    it "should fail when evaluating for colors" do
      expect { Opuesto.new(Verde.new).evaluate }.
        to raise_error(GbsTypeError, "colors don't have opposite")
    end

  end

end

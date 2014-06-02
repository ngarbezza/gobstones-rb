describe "primitive functions" do

  let(:program) { Program.new [], nil }
  let(:context) { ProgramExecutionContext.for program }
  let(:black) { Negro.new }
  let(:west) { Oeste.new }

  describe "nroBolitas() function" do

    it "should evaluates correctly in a clean context" do
      expect(NroBolitas.new(black).evaluate(context)).to eq(0.to_gbs_num)
    end

    it "should evaluate correctly in a context with some data" do
      5.times { context.head.put black }
      expect(NroBolitas.new(black).evaluate(context)).to eq(5.to_gbs_num)
    end

  end

  describe "hayBolitas() function" do

    it "should evaluate correctly in a clean context" do
      expect(HayBolitas.new(black).evaluate(context)).to eq(false.to_gbs_bool)
    end

    it "should evaluate correctly in a context with some data" do
      context.head.put black
      expect(HayBolitas.new(black).evaluate(context)).to eq(true.to_gbs_bool)
    end

  end

  describe "puedeMover() function" do

    it "should evaluate correctly in a clean context" do
      expect(PuedeMover.new(west).evaluate(context)).to eq(false.to_gbs_bool)
    end

    it "should evaluate correctly in a modified context" do
      context.head.move(Este.new)
      expect(PuedeMover.new(west).evaluate(context)).to eq(true.to_gbs_bool)
    end

  end

  describe "siguiente() function" do

    it "should evaluate correctly for numbers" do
      expect(Siguiente.new(15.to_gbs_num).evaluate(context)).to eq(16.to_gbs_num)
    end

    it "should evaluate correctly for colors" do
      expect(Siguiente.new(Azul.new).evaluate(context)).to eq(Negro.new)
      expect(Siguiente.new(Negro.new).evaluate(context)).to eq(Rojo.new)
      expect(Siguiente.new(Rojo.new).evaluate(context)).to eq(Verde.new)
      expect(Siguiente.new(Verde.new).evaluate(context)).to eq(Azul.new)
    end

    it "should evaluate correctly for directions" do
      expect(Siguiente.new(Norte.new).evaluate(context)).to eq(Este.new)
      expect(Siguiente.new(Este.new).evaluate(context)).to eq(Sur.new)
      expect(Siguiente.new(Sur.new).evaluate(context)).to eq(Oeste.new)
      expect(Siguiente.new(Oeste.new).evaluate(context)).to eq(Norte.new)
    end

    it "should evaluate correctly for booleans" do
      expect(Siguiente.new(True.new).evaluate(context)).to eq(False.new)
      expect(Siguiente.new(False.new).evaluate(context)).to eq(True.new)
    end

  end

  describe "previo() function" do

    it "should evaluate correctly for numbers" do
      expect(Previo.new(43.to_gbs_num).evaluate(context)).to eq(42.to_gbs_num)
    end

    it "should evaluate correctly for colors" do
      expect(Previo.new(Azul.new).evaluate(context)).to eq(Verde.new)
      expect(Previo.new(Negro.new).evaluate(context)).to eq(Azul.new)
      expect(Previo.new(Rojo.new).evaluate(context)).to eq(Negro.new)
      expect(Previo.new(Verde.new).evaluate(context)).to eq(Rojo.new)
    end

    it "should evaluate correctly for directions" do
      expect(Previo.new(Norte.new).evaluate(context)).to eq(Oeste.new)
      expect(Previo.new(Este.new).evaluate(context)).to eq(Norte.new)
      expect(Previo.new(Sur.new).evaluate(context)).to eq(Este.new)
      expect(Previo.new(Oeste.new).evaluate(context)).to eq(Sur.new)
    end

    it "should evaluate correctly for booleans" do
      expect(Previo.new(True.new).evaluate(context)).to eq(False.new)
      expect(Previo.new(False.new).evaluate(context)).to eq(True.new)
    end

  end

  describe "opuesto() function" do

    it "should evaluate correctly for numbers" do
      expect(Opuesto.new(23.to_gbs_num).evaluate(context)).to eq(-23.to_gbs_num)
      expect(Opuesto.new(-42.to_gbs_num).evaluate(context)).to eq(42.to_gbs_num)
    end

    it "should evaluate correctly for directions" do
      expect(Opuesto.new(Norte.new).evaluate(context)).to eq(Sur.new)
      expect(Opuesto.new(Este.new).evaluate(context)).to eq(Oeste.new)
      expect(Opuesto.new(Sur.new).evaluate(context)).to eq(Norte.new)
      expect(Opuesto.new(Oeste.new).evaluate(context)).to eq(Este.new)
    end

    it "should evaluate correctly for booleans" do
      expect(Opuesto.new(True.new).evaluate(context)).to eq(False.new)
      expect(Opuesto.new(False.new).evaluate(context)).to eq(True.new)
    end

    it "should fail when evaluating for colors" do
      expect { Opuesto.new(Verde.new).evaluate(context) }.
        to raise_error(GobstonesTypeError, "colors don't have opposite")
    end

  end

end

describe "primitive functions" do

  let(:context) { clean_context }

  describe "nroBolitas() function" do

    it "should evaluates correctly in a clean context" do
      expect(NroBolitas.new(negro).evaluate(context)).to eq(0.to_gbs_num)
    end

    it "should evaluate correctly in a context with some data" do
      5.times { context.head.put negro }
      expect(NroBolitas.new(negro).evaluate(context)).to eq(5.to_gbs_num)
    end

  end

  describe "hayBolitas() function" do

    it "should evaluate correctly in a clean context" do
      expect(HayBolitas.new(negro).evaluate(context)).to eq(false_value)
    end

    it "should evaluate correctly in a context with some data" do
      context.head.put negro
      expect(HayBolitas.new(negro).evaluate(context)).to eq(true_value)
    end

  end

  describe "puedeMover() function" do

    it "should evaluate correctly in a clean context" do
      expect(PuedeMover.new(oeste).evaluate(context)).to eq(false_value)
    end

    it "should evaluate correctly in a modified context" do
      context.head.move(este)
      expect(PuedeMover.new(oeste).evaluate(context)).to eq(true_value)
    end

  end

  describe "siguiente() function" do

    it "should evaluate correctly for numbers" do
      expect(Siguiente.new(15.to_gbs_num).evaluate(context)).to eq(16.to_gbs_num)
    end

    it "should evaluate correctly for colors" do
      expect(Siguiente.new(azul).evaluate(context)).to eq(negro)
      expect(Siguiente.new(negro).evaluate(context)).to eq(rojo)
      expect(Siguiente.new(rojo).evaluate(context)).to eq(verde)
      expect(Siguiente.new(verde).evaluate(context)).to eq(azul)
    end

    it "should evaluate correctly for directions" do
      expect(Siguiente.new(norte).evaluate(context)).to eq(este)
      expect(Siguiente.new(este).evaluate(context)).to eq(sur)
      expect(Siguiente.new(sur).evaluate(context)).to eq(oeste)
      expect(Siguiente.new(oeste).evaluate(context)).to eq(norte)
    end

    it "should evaluate correctly for booleans" do
      expect(Siguiente.new(true_value).evaluate(context)).to eq(false_value)
      expect(Siguiente.new(false_value).evaluate(context)).to eq(true_value)
    end

  end

  describe "previo() function" do

    it "should evaluate correctly for numbers" do
      expect(Previo.new(43.to_gbs_num).evaluate(context)).to eq(42.to_gbs_num)
    end

    it "should evaluate correctly for colors" do
      expect(Previo.new(azul).evaluate(context)).to eq(verde)
      expect(Previo.new(negro).evaluate(context)).to eq(azul)
      expect(Previo.new(rojo).evaluate(context)).to eq(negro)
      expect(Previo.new(verde).evaluate(context)).to eq(rojo)
    end

    it "should evaluate correctly for directions" do
      expect(Previo.new(norte).evaluate(context)).to eq(oeste)
      expect(Previo.new(este).evaluate(context)).to eq(norte)
      expect(Previo.new(sur).evaluate(context)).to eq(este)
      expect(Previo.new(oeste).evaluate(context)).to eq(sur)
    end

    it "should evaluate correctly for booleans" do
      expect(Previo.new(true_value).evaluate(context)).to eq(false_value)
      expect(Previo.new(false_value).evaluate(context)).to eq(true_value)
    end

  end

  describe "opuesto() function" do

    it "should evaluate correctly for numbers" do
      expect(Opuesto.new(23.to_gbs_num).evaluate(context)).to eq(-23.to_gbs_num)
      expect(Opuesto.new(-42.to_gbs_num).evaluate(context)).to eq(42.to_gbs_num)
    end

    it "should evaluate correctly for directions" do
      expect(Opuesto.new(norte).evaluate(context)).to eq(sur)
      expect(Opuesto.new(este).evaluate(context)).to eq(oeste)
      expect(Opuesto.new(sur).evaluate(context)).to eq(norte)
      expect(Opuesto.new(oeste).evaluate(context)).to eq(este)
    end

    it "should evaluate correctly for booleans" do
      expect(Opuesto.new(true_value).evaluate(context)).to eq(false_value)
      expect(Opuesto.new(false_value).evaluate(context)).to eq(true_value)
    end

    it "should fail when evaluating for colors" do
      expect { Opuesto.new(verde).evaluate(context) }.
        to raise_error(GobstonesTypeError, "colors don't have opposite")
    end

  end

end

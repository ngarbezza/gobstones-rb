describe VarName do

  let(:context) { ExecutionContext.new }
  let(:variable_name) { VarName.new 'var' }

  it "should return the associated value if it was defined in the context" do
    context.set variable_name, 42.to_gbs_num
    expect(variable_name.evaluate(context)).to eq(42.to_gbs_num)
  end

  it "should raise an error if there is no definition in context" do
    expect { variable_name.evaluate context }
      .to raise_error(UndefinedVariableError)
  end

  describe "#named?" do

    it "is named 'var'" do
      expect(variable_name.named? 'var').to be true
    end

    it "is not named 'blah'" do
      expect(variable_name.named? 'blah').to be false
    end

  end

end

describe VarName do
  let(:context) { clean_context }
  let(:variable_name) { 'var'.to_var_name }

  it 'returns the associated value if it was defined in the context' do
    context.set variable_name, 42.to_gbs_num

    expect(variable_name.evaluate(context)).to eq(42.to_gbs_num)
  end

  it 'raises an error if there is no definition in context' do
    expect { variable_name.evaluate context }.to raise_error(UndefinedVariableError)
  end

  describe '#named?' do
    it "is named 'var'" do
      expect(variable_name.named?('var')).to be(true)
    end

    it "is not named 'blah'" do
      expect(variable_name.named?('blah')).to be(false)
    end
  end
end

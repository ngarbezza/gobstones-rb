describe EnclosedByParensExpression do

  let(:context) { clean_context }
  let(:red) { Rojo.new }

  it "evaluates the inner expression" do
    expression = EnclosedByParensExpression.new red

    expect(expression.evaluate(context)).to eq(red)
  end

end

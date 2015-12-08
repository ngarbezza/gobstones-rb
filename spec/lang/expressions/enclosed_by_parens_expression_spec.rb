describe EnclosedByParensExpression do

  let(:context) { clean_context }

  it 'evaluates the inner expression' do
    expression = EnclosedByParensExpression.new(rojo)

    expect(expression.evaluate(context)).to eq(rojo)
  end

end

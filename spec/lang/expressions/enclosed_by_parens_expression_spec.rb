# frozen_string_literal: true

RSpec.describe EnclosedByParensExpression do
  let(:context) { any_context }

  it 'evaluates the inner expression' do
    expect(described_class.new(rojo).evaluate(context)).to eq(rojo)
  end
end

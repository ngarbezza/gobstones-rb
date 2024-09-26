# frozen_string_literal: true

RSpec.describe VarTuple do
  let(:var_tuple) { described_class.with_names(%w[a b c]) }

  it 'returns its length' do
    expect(var_tuple.length).to eq(3)
  end

  it 'returns a variable at a given index' do
    expect(var_tuple.variable_at(0)).to eq('a'.to_var_name)
    expect(var_tuple.variable_at(1)).to eq('b'.to_var_name)
    expect(var_tuple.variable_at(2)).to eq('c'.to_var_name)
  end
end

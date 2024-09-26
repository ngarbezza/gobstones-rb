# frozen_string_literal: true

RSpec.describe Gobstones::Parser, 'var tuples' do
  it 'parses an empty var tuple' do
    var_tuple = VarTuple.empty

    expect('()').to be_parsed_as(:var_tuple).and_return(var_tuple)
    expect('(   )').to be_parsed_as(:var_tuple).and_return(var_tuple)
  end

  it 'parses a var tuple with one arg' do
    var_tuple = VarTuple.with_names(%w[myVar])

    expect('(myVar)').to be_parsed_as(:var_tuple).and_return(var_tuple)
    expect('(  myVar )').to be_parsed_as(:var_tuple).and_return(var_tuple)
  end

  it 'parses a var tuple with many args' do
    var_tuple = VarTuple.with_names(%w[firstVar secondVar thirdVar])

    expect('(firstVar, secondVar, thirdVar)').to be_parsed_as(:var_tuple).and_return(var_tuple)
    expect('( firstVar , secondVar,thirdVar )').to be_parsed_as(:var_tuple).and_return(var_tuple)
  end
end

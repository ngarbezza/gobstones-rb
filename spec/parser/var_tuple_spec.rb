describe Gobstones::Parser, "var tuples" do

  it "should parse an empty var tuple" do
    var_tuple = VarTuple.new []

    expect('()').to be_parsed_as(:var_tuple).and_return(var_tuple)
    expect('(   )').to be_parsed_as(:var_tuple).and_return(var_tuple)
  end

  it "should parse a var tuple with one arg" do
    var = VarName.new 'myVar'
    var_tuple = VarTuple.new [var]

    expect('(myVar)').to be_parsed_as(:var_tuple).and_return(var_tuple)
    expect('(  myVar )').to be_parsed_as(:var_tuple).and_return(var_tuple)
  end

  it "should parse a var tuple with many args" do
    first = VarName.new 'firstVar'
    second = VarName.new 'secondVar'
    third = VarName.new 'thirdVar'
    var_tuple = VarTuple.new [first, second, third]

    expect('(firstVar, secondVar, thirdVar)').
      to be_parsed_as(:var_tuple).and_return(var_tuple)
    expect('( firstVar , secondVar,thirdVar )').
      to be_parsed_as(:var_tuple).and_return(var_tuple)
  end

end
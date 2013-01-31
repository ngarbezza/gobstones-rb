describe Gobstones::Parser, "var tuples" do

  it "should parse an empty var tuple" do
    var_tuple = VarTuple.new []

    '()'.should be_parsed_to var_tuple
    '(   )'.should be_parsed_to var_tuple
  end

  it "should parse a var tuple with one arg" do
    pending "until complete entire grammar"
    var = VarName.new 'myVar'
    var_tuple = VarTuple.new [var]

    '(myVar)'.should be_parsed_to var_tuple
    '(  myVar )'.should be_parsed_to var_tuple
  end

  it "should parse a var tuple with many args" do
    first = VarName.new 'firstVar'
    second = VarName.new 'secondVar'
    third = VarName.new 'thirdVar'
    var_tuple = VarTuple.new [first, second, third]

    '(firstVar, secondVar, thirdVar)'.should be_parsed_to var_tuple
    '( firstVar , secondVar,thirdVar )'.should be_parsed_to var_tuple
  end

end

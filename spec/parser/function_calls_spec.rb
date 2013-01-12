describe Gobstones::Parser, "function calls" do

  it "should parse a function call without args" do
    expected = FuncCall.new 'f1'
    'f1()'.should be_parsed_to expected
  end

  it "should not parse a function call without a valid identifier" do
    expected = FuncCall.new 'F1'
    'F1()'.should_not be_parsed_to(expected)
  end

end

describe Gobstones::Parser, "arithmetic expressions" do

  it "should parse a + expression" do
    arg1 = Expressions::VarName.new 'left'
    arg2 = Expressions::VarName.new 'right'
    sum = Expressions::Add.new arg1, arg2
    'left+right'.should be_parsed_to sum
    'left +  right'.should be_parsed_to sum
  end

  it "should parse a nested + expression" do
    arg1 = Expressions::VarName.new 'first'
    arg2 = Expressions::VarName.new 'second'
    arg3 = Expressions::VarName.new 'third'
    sum1plus2 = Expressions::Add.new arg1, arg2
    total = Expressions::Add.new sum1plus2, arg3
    'first + second + third'.should be_parsed_to total
  end

  it "should parse a - expression" do
    arg1 = Expressions::VarName.new 'left'
    arg2 = Expressions::VarName.new 'right'
    sum = Expressions::Sub.new arg1, arg2
    'left-right'.should be_parsed_to sum
    'left -  right'.should be_parsed_to sum
  end

  it "should parse a nested expression with + and -" do
    arg1 = Expressions::VarName.new 'first'
    arg2 = Expressions::VarName.new 'second'
    arg3 = Expressions::VarName.new 'third'
    sum1plus2 = Expressions::Add.new arg1, arg2
    total = Expressions::Sub.new sum1plus2, arg3
    'first + second - third'.should be_parsed_to total
  end

end

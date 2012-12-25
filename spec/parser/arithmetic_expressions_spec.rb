describe Gobstones::Parser, "arithmetic expressions" do

  describe "addition and subtraction" do

    it "should parse a + expression" do
      arg1 = Expressions::VarName.new 'left'
      arg2 = Expressions::VarName.new 'right'
      sum = Expressions::Add.new arg1, arg2
      'left+right'.should be_parsed_to sum
      'left +  right'.should be_parsed_to sum
    end

    it "should parse a nested + expression, associating to left" do
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

    it "should parse a nested expression with + and -, associating to left" do
      arg1 = Expressions::VarName.new 'first'
      arg2 = Expressions::VarName.new 'second'
      arg3 = Expressions::VarName.new 'third'
      sum1plus2 = Expressions::Add.new arg1, arg2
      total = Expressions::Sub.new sum1plus2, arg3
      'first + second - third'.should be_parsed_to total
    end

  end

  describe "multiplication, division and modulus" do

    it "should parse a * expression" do
      arg1 = Expressions::VarName.new 'left'
      arg2 = Expressions::VarName.new 'right'
      mul = Expressions::Mul.new arg1, arg2
      'left*right'.should be_parsed_to mul
      'left   * right'.should be_parsed_to mul
    end

    it "should parse a nested * expression" do
      arg1 = Expressions::VarName.new 'first'
      arg2 = Expressions::VarName.new 'second'
      arg3 = Expressions::VarName.new 'third'
      mul12 = Expressions::Mul.new arg1, arg2
      total = Expressions::Mul.new mul12, arg3
      'first * second * third'.should be_parsed_to total
    end

    it "should parse a div expression" do
      arg1 = Expressions::VarName.new 'left'
      arg2 = Expressions::VarName.new 'right'
      div = Expressions::Div.new arg1, arg2
      'left div right'.should be_parsed_to div
      'left   div right'.should be_parsed_to div
    end

    it "should parse a mod expression" do
      arg1 = Expressions::VarName.new 'left'
      arg2 = Expressions::VarName.new 'right'
      mod = Expressions::Mod.new arg1, arg2
      'left mod right'.should be_parsed_to mod
      'left mod   right'.should be_parsed_to mod
    end

    it "should parse a power expression" do
      arg1 = Expressions::VarName.new 'left'
      arg2 = Expressions::VarName.new 'right'
      pow = Expressions::Pow.new arg1, arg2
      'left^right'.should be_parsed_to pow
      'left ^  right'.should be_parsed_to pow
    end

  end

end

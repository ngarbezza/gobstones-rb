describe RepeatWithCmd do

  let(:context) { ExecutionContext.new }
  let(:var_name) { VarName.new 'var' }

  it "should iterate over numbers" do
    repeat_with = RepeatWithCmd.new var_name, 1.to_gbs_num, 10.to_gbs_num, CmdBlock.new([Poner.new(Rojo.new)])
    repeat_with.evaluate context
    context.head.number_of_balls(Rojo.new).should == 10
  end

  it "should throw an error if the range values have not the same type" do
    repeat_with = RepeatWithCmd.new var_name, 1.to_gbs_num, Este.new, CmdBlock.new([])
    expect { repeat_with.evaluate context }
      .to raise_error(GbsTypeError, /types don't match in range values/)
  end

  it "should throw an error if the index variable is previously defined" do
    repeat_with = RepeatWithCmd.new var_name, 1.to_gbs_num, 5.to_gbs_num, CmdBlock.new([])
    context.set var_name, 42.to_gbs_num
    expect { repeat_with.evaluate context }
      .to raise_error(GbsRuntimeError, /index variable can't be used because it's already defined/)
  end

  it "should remove the index variable assignment after execution" do
    repeat_with = RepeatWithCmd.new var_name, Azul.new, Verde.new, CmdBlock.new([])
    repeat_with.evaluate context
    context.has_variable_named?('var').should be_false
  end

  it "should allow to use the index variable inside the command block" do
    cmd_block = CmdBlock.new [Poner.new(VarName.new('var'))]
    repeat_with = RepeatWithCmd.new var_name, Azul.new, Verde.new, cmd_block
    repeat_with.evaluate context
    context.head.are_there_balls?(Azul.new).should be_true
    context.head.are_there_balls?(Negro.new).should be_true
    context.head.are_there_balls?(Rojo.new).should be_true
    context.head.are_there_balls?(Verde.new).should be_true
  end

end

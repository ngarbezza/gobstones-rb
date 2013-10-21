describe RepeatWithCmd do

  let(:context) { ProgramExecutionContext.for double('GobstonesProgram') }
  let(:var_name) { VarName.new 'var' }

  it "should iterate over numbers" do
    repeat_with = RepeatWithCmd.new var_name, 1.to_gbs_num, 10.to_gbs_num, CmdBlock.new([Poner.new(Rojo.new)])
    repeat_with.evaluate context
    expect(context.head.number_of_balls(Rojo.new)).to eq(10)
  end

  it "should throw an error if the range values have not the same type" do
    repeat_with = RepeatWithCmd.new var_name, 1.to_gbs_num, Este.new, CmdBlock.new([])
    expect { repeat_with.evaluate context }
      .to raise_error(GobstonesTypeError, /types don't match in range values/)
  end

  it "should throw an error if the index variable is previously defined" do
    repeat_with = RepeatWithCmd.new var_name, 1.to_gbs_num, 5.to_gbs_num, CmdBlock.new([])
    context.set var_name, 42.to_gbs_num
    expect { repeat_with.evaluate context }
      .to raise_error(GobstonesRuntimeError, /index variable can't be used because it's already defined/)
  end

  it "should remove the index variable assignment after execution" do
    repeat_with = RepeatWithCmd.new var_name, Azul.new, Verde.new, CmdBlock.new([])
    repeat_with.evaluate context
    expect(context.has_variable_named?('var')).to be_false
  end

  it "should allow to use the index variable inside the command block" do
    cmd_block = CmdBlock.new [Poner.new(VarName.new('var'))]
    repeat_with = RepeatWithCmd.new var_name, Azul.new, Verde.new, cmd_block
    repeat_with.evaluate context
    expect(context.head.are_there_balls?(Azul.new)).to be_true
    expect(context.head.are_there_balls?(Negro.new)).to be_true
    expect(context.head.are_there_balls?(Rojo.new)).to be_true
    expect(context.head.are_there_balls?(Verde.new)).to be_true
  end

end
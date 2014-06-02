describe RepeatWithCmd do

  let(:program) { Program.new [], nil }
  let(:context) { ProgramExecutionContext.for program }
  let(:var_name) { VarName.new 'var' }

  it "iterates over numbers when evaluating" do
    command_block = CmdBlock.new [Poner.new(Rojo.new)]
    repeat_with = RepeatWithCmd.new var_name, 1.to_gbs_num, 10.to_gbs_num, command_block

    repeat_with.evaluate context

    expect(context.head.number_of_balls(Rojo.new)).to eq(10)
  end

  it "raises an error if the range values have not the same type" do
    repeat_with = RepeatWithCmd.new var_name, 1.to_gbs_num, Este.new, CmdBlock.empty

    expect { repeat_with.evaluate context }
      .to raise_error(GobstonesTypeError, /types don't match in range values/)
  end

  it "raises an error if the index variable is previously defined" do
    repeat_with = RepeatWithCmd.new var_name, 1.to_gbs_num, 5.to_gbs_num, CmdBlock.empty

    context.set var_name, 42.to_gbs_num

    expect { repeat_with.evaluate context }
      .to raise_error(GobstonesRuntimeError, /index variable can't be used because it's already defined/)
  end

  it "removes the index variable assignment after execution" do
    repeat_with = RepeatWithCmd.new var_name, Azul.new, Verde.new, CmdBlock.empty

    repeat_with.evaluate context

    expect(context.has_variable_named?('var')).to be false
  end

  it "allows to use the index variable inside the command block" do
    cmd_block = CmdBlock.new [Poner.new(var_name)]
    repeat_with = RepeatWithCmd.new var_name, Azul.new, Verde.new, cmd_block

    repeat_with.evaluate context

    expect(context.head.are_there_balls?(Azul.new)).to be true
    expect(context.head.are_there_balls?(Negro.new)).to be true
    expect(context.head.are_there_balls?(Rojo.new)).to be true
    expect(context.head.are_there_balls?(Verde.new)).to be true
  end

  it "does no iterations if the from is higher than the to" do
    cmd_block = CmdBlock.new [Poner.new(Verde.new)]
    repeat_with = RepeatWithCmd.new var_name, 8.to_gbs_num, 4.to_gbs_num, cmd_block

    repeat_with.evaluate context

    expect(context.head.are_there_balls?(Verde.new)).to be false
  end

end

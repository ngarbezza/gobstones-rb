describe CmdBlock do

  it "should evaluate all inner commands" do
    context = ExecutionContext.new
    cmd_block = CmdBlock.new [
      Poner.new(Rojo.new), Poner.new(Verde.new),
      Poner.new(Negro.new), Poner.new(Azul.new)]
    cmd_block.evaluate context
    context.head.are_there_balls?(Rojo.new).should be_true
    context.head.are_there_balls?(Azul.new).should be_true
    context.head.are_there_balls?(Negro.new).should be_true
    context.head.are_there_balls?(Verde.new).should be_true
  end

end

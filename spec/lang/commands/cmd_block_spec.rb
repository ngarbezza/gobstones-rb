describe CmdBlock do

  let(:context) { clean_context }

  it "evaluates all inner commands" do
    cmd_block = CmdBlock.new [
      Poner.new(Rojo.new), Poner.new(Verde.new),
      Poner.new(Negro.new), Poner.new(Azul.new)]
    cmd_block.evaluate context
    expect(context.head.are_there_balls?(Rojo.new)).to be true
    expect(context.head.are_there_balls?(Azul.new)).to be true
    expect(context.head.are_there_balls?(Negro.new)).to be true
    expect(context.head.are_there_balls?(Verde.new)).to be true
  end

  it "builds an empty command block" do
    expect(CmdBlock.new []).to be_empty
    expect(CmdBlock.empty).to be_empty
  end

end

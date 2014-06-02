describe CmdBlock do

  let(:context) { clean_context }

  it "evaluates all inner commands" do
    cmd_block = CmdBlock.new [
      Poner.new(rojo), Poner.new(verde),
      Poner.new(negro), Poner.new(azul)]
    cmd_block.evaluate context
    expect(context.head.are_there_balls?(azul)).to be true
    expect(context.head.are_there_balls?(negro)).to be true
    expect(context.head.are_there_balls?(rojo)).to be true
    expect(context.head.are_there_balls?(verde)).to be true
  end

  it "builds an empty command block" do
    expect(CmdBlock.new []).to be_empty
    expect(CmdBlock.empty).to be_empty
  end

end

describe IfThenElse do
  let(:context) { clean_context }
  let(:then_block) { CommandBlock.new([Poner.new(verde)]) }
  let(:else_block) { CommandBlock.new([Poner.new(rojo)]) }

  it "evaluates the 'then' block and it does not evaluate the 'else' block" do
    IfThenElse.new(true_value, then_block, else_block).evaluate context

    expect(context.head.are_there_balls?(verde)).to be(true)
    expect(context.head.are_there_balls?(rojo)).to be(false)
  end

  it "does not evaluate the 'then' block and it evaluates the 'else' block" do
    IfThenElse.new(false_value, then_block, else_block).evaluate context

    expect(context.head.are_there_balls?(verde)).to be(false)
    expect(context.head.are_there_balls?(rojo)).to be(true)
  end
end

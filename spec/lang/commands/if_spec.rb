RSpec.describe If do
  let(:context) { clean_context }
  let(:then_block) { CommandBlock.new([Poner.new(verde)]) }

  it "evaluates the 'then' command block if the condition is true" do
    If.new(true_value, then_block).evaluate context

    expect(context.head.are_there_balls?(verde)).to be(true)
  end

  it "does not evaluate the 'then' command block if the condition is false" do
    If.new(false_value, then_block).evaluate context

    expect(context.head.are_there_balls?(verde)).to be(false)
  end

  it 'raises a type error if the condition is not boolean' do
    [42.to_gbs_num, norte, verde].each do |value|
      if_cmd = If.new(value, then_block)

      expect { if_cmd.evaluate context }.to raise_error(GobstonesTypeError, /is not a boolean/)
    end
  end
end

RSpec.describe While do
  let(:context) { clean_context }
  let(:while_block) { CommandBlock.with_just(Poner.new(verde)) }

  def stub_condition(times)
    instance_double(Boolean).tap do |condition|
      expected_values = [true_value] * times + [false_value]
      allow(condition).to receive(:evaluate).and_return(*expected_values)
    end
  end

  it 'evaluates the command block until the condition is not satisfied' do
    while_cmd = described_class.new(stub_condition(3), while_block)

    while_cmd.evaluate context

    expect(context.head.number_of_balls(verde)).to eq(3)
  end

  it 'does not evaluate the command block if the condition is false' do
    while_cmd = described_class.new(stub_condition(0), while_block)

    while_cmd.evaluate context

    expect_no_balls(verde)
  end

  it 'fails with type error if the condition is not boolean' do
    while_cmd = described_class.new(sur, while_block)

    expect { while_cmd.evaluate context }.to raise_error(GobstonesTypeError, /is not a boolean/)
  end

  it 'fails with stack overflow if the condition is always true' do
    while_cmd = described_class.new(true_value, while_block)

    expect { while_cmd.evaluate context }.to raise_error(GobstonesRuntimeError, /stack overflow/)
  end
end

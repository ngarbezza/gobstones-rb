RSpec.describe RepeatWith do
  let(:context) { clean_context }
  let(:var_name) { 'var'.to_var_name }

  it 'iterates over numbers when evaluating' do
    command_block = CommandBlock.new([Poner.new(rojo)])
    repeat_with = RepeatWith.new(var_name, 1.to_gbs_num, 10.to_gbs_num, command_block)

    repeat_with.evaluate context

    expect(context.head.number_of_balls(rojo)).to eq(10)
  end

  it 'raises an error if the range values have not the same type' do
    repeat_with = RepeatWith.new(var_name, 1.to_gbs_num, este, empty_body)

    expect { repeat_with.evaluate context }.
      to raise_error(GobstonesTypeError, /types don't match in range values/)
  end

  it 'raises an error if the index variable is previously defined' do
    repeat_with = RepeatWith.new(var_name, 1.to_gbs_num, 5.to_gbs_num, empty_body)

    context.set var_name, 42.to_gbs_num

    expect { repeat_with.evaluate context }.
      to raise_error(GobstonesRuntimeError, /index variable can't be used because it's already defined/)
  end

  it 'removes the index variable assignment after execution' do
    repeat_with = RepeatWith.new(var_name, azul, verde, empty_body)

    repeat_with.evaluate context

    expect(context.has_variable_named?('var')).to be(false)
  end

  it 'allows to use the index variable inside the command block' do
    cmd_block = CommandBlock.new([Poner.new(var_name)])
    repeat_with = RepeatWith.new(var_name, azul, verde, cmd_block)

    repeat_with.evaluate context

    expect(context.head.are_there_balls?(azul)).to be(true)
    expect(context.head.are_there_balls?(negro)).to be(true)
    expect(context.head.are_there_balls?(rojo)).to be(true)
    expect(context.head.are_there_balls?(verde)).to be(true)
  end

  it 'does exactly one iteration if range values are the same' do
    cmd_block = CommandBlock.new([Poner.new(verde)])
    repeat_with = RepeatWith.new(var_name, 1.to_gbs_num, 1.to_gbs_num, cmd_block)

    repeat_with.evaluate context

    expect(context.head.are_there_balls?(verde)).to be(true)
  end

  it 'does no iterations if the from is higher than the to' do
    cmd_block = CommandBlock.new([Poner.new(verde)])
    repeat_with = RepeatWith.new(var_name, 8.to_gbs_num, 4.to_gbs_num, cmd_block)

    repeat_with.evaluate context

    expect(context.head.are_there_balls?(verde)).to be(false)
  end
end

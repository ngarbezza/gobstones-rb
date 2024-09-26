# frozen_string_literal: true

RSpec.describe Main do
  subject(:if_evaluation) { main.evaluate(context) }

  let(:context) { clean_context }
  let(:return_tuple) { VarTuple.with_names(%w[x y]) }
  let(:return_from_main) { ReturnFromMain.new(return_tuple) }
  let(:assign_x) { SingleAssignment.new('x'.to_var_name, 42.to_gbs_num) }
  let(:assign_y) { SingleAssignment.new('y'.to_var_name, verde) }
  let(:command_block) { CommandBlock.new([assign_x, assign_y]) }
  let(:main) { described_class.new(command_block, return_from_main) }

  it 'evaluates the body' do
    if_evaluation

    %w[x y].each { |var_name| expect(context).to have_variable_named(var_name) }
  end

  context 'with return statement' do
    it 'returns its return value, if there is one' do
      expect(if_evaluation).to eq(
        'x'.to_var_name => 42.to_gbs_num,
        'y'.to_var_name => verde,
      )
    end
  end

  context 'without return statement' do
    let(:return_from_main) { no_return_statement }

    it 'returns an empty result when no return statement is present' do
      expect(if_evaluation).to be_empty
    end
  end
end

# frozen_string_literal: true

RSpec.describe If do
  subject(:evaluate_if_command) { described_class.new(condition, then_block).evaluate(context) }

  let(:context) { clean_context }
  let(:then_block) { CommandBlock.with_just(Poner.new(verde)) }

  context 'when condition is true' do
    let(:condition) { true_value }

    it "evaluates the 'then' block" do
      evaluate_if_command and expect_balls(verde)
    end
  end

  context 'when condition is false' do
    let(:condition) { false_value }

    it "does not evaluate the 'then' block" do
      evaluate_if_command and expect_no_balls(verde)
    end
  end

  [42.to_gbs_num, norte, verde].each do |value|
    context "when condition has a wrong type (#{value.class})" do
      let(:condition) { value }

      it 'raises a type error' do
        expect { evaluate_if_command }.to raise_error(GobstonesTypeError, /is not a boolean/)
      end
    end
  end
end

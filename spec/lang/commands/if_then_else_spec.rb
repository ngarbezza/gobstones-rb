# frozen_string_literal: true

RSpec.describe IfThenElse do
  let(:context) { clean_context }
  let(:then_block) { CommandBlock.with_just(Poner.new(verde)) }
  let(:else_block) { CommandBlock.with_just(Poner.new(rojo)) }

  it "evaluates the 'then' block and it does not evaluate the 'else' block" do
    described_class.new(true_value, then_block, else_block).evaluate context

    expect_balls(verde)
    expect_no_balls(rojo)
  end

  it "does not evaluate the 'then' block and it evaluates the 'else' block" do
    described_class.new(false_value, then_block, else_block).evaluate context

    expect_no_balls(verde)
    expect_balls(rojo)
  end
end

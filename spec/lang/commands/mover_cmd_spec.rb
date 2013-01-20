require 'gobstones/lang/commands/mover_cmd'
require 'gobstones/runner/gbs_type_error'

describe Mover do

  let(:context) { ExecutionContext.new }
  let(:north) { Norte.new }
  let(:south) { Sur.new }

  it "should run" do
    cmd = Mover.new north

    cmd.evaluate context

    context.head.x_pos.should == 0
    context.head.y_pos.should == 1
  end

  it "should undo" do
    cmd = Mover.new north

    cmd.evaluate context
    cmd.undo context

    context.head.x_pos.should == 0
    context.head.y_pos.should == 0
  end

  it "should return opposite cmd" do
    cmd = Mover.new north
    opp = Mover.new south

    cmd.opposite.should == opp
  end

  it "should fail if types don't match" do
    cmd = Mover.new Verde.new
    expect {
      cmd.evaluate context
    }.to raise_error(GbsTypeError, /is not a direction/)
  end

  it "should fail when out of board" do
    cmd = Mover.new south

    expect { cmd.evaluate context }.to raise_error(OutOfBoardError)
  end

end

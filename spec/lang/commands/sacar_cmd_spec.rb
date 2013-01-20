require 'gobstones/lang/commands/poner_cmd'
require 'gobstones/lang/commands/sacar_cmd'
require 'gobstones/runner/gbs_type_error'

describe Sacar do

  let(:context) { ExecutionContext.new }
  let(:red) { Rojo.new }

  it "should execute" do
    cmd = Sacar.new red
    3.times { context.head.put red }

    cmd.evaluate context

    context.head.number_of_balls(red).should == 2
  end

  it "should undo" do
    cmd = Sacar.new red

    cmd.undo context

    context.head.number_of_balls(red).should == 1
  end

  it "should return the opposite cmd" do
    cmd = Sacar.new red
    opp = Poner.new red
    cmd.opposite.should == opp
  end

  it "should fail if types don't match" do
    cmd = Sacar.new True.new
    expect {
      cmd.evaluate context
    }.to raise_error(GbsTypeError, /is not a color/)
  end

end


require 'gobstones/lang/commands/poner_cmd'
require 'gobstones/lang/commands/sacar_cmd'
require 'gobstones/runner/gbs_type_error'

describe Poner do

  let(:context) { ExecutionContext.new }
  let(:green) { Verde.new }

  it "should execute" do
    cmd = Poner.new green
    cmd.evaluate context

    context.head.number_of_balls(green).should == 1
  end

  it "should undo" do
    cmd = Poner.new green
    context.head.put green

    cmd.undo context

    context.head.number_of_balls(green).should == 0
  end

  it "should return the opposite cmd" do
    cmd = Poner.new green
    opp = Sacar.new green
    cmd.opposite.should == opp
  end

  it "should fail if types don't match" do
    cmd = Poner.new Norte.new
    expect {
      cmd.evaluate context
    }.to raise_error(GbsTypeError, /is not a color/)
  end

end


require 'gobstones/lang/commands/skip_cmd'
require 'gobstones/lang/commands/boom_cmd'

describe Gobstones::Parser, "simple commands" do

  describe "primitives" do

    it "should parse a Skip cmd" do
      skip_cmd = Skip.new
      'Skip'.should be_parsed_to(skip_cmd)
    end

    it "should parse a BOOM cmd" do
      boom_cmd = Boom.new 'the message'
      'BOOM("the message")'.should be_parsed_to(boom_cmd)
    end

  end

end

describe Gobstones::Parser, "simple commands" do

  describe "primitives" do

    it "should parse a Skip cmd" do
      skip_cmd = Skip.new
      'Skip'.should be_parsed_to(skip_cmd)
    end

  end

end

describe Gobstones, "type checker" do

  describe "board expressions" do

    describe "puedeMover()" do

      it "should allow a direction as argument" do
        [Lang::Norte.new, Lang::Sur.new, Lang::Este.new, Lang::Oeste.new].each do |dir|
            puede_mover_dir = Functions::PuedeMover.new dir
            result = puede_mover_dir.type_check
            result.ok?.should be_true
          end
      end

      it "should not allow a number as argument" do
        puede_mover_number = Functions::PuedeMover.new Lang::Number.new(42)
        result = puede_mover_number.type_check
        result.ok?.should be_false
      end

      it "should not allow a color as argument" do
        puede_mover_color = Functions::PuedeMover.new Lang::Verde.new
        result = puede_mover_color.type_check
        result.ok?.should be_false
      end

      it "should not allow a boolean as argument" do
        puede_mover_bool = Functions::PuedeMover.new Lang::True.new
        result = puede_mover_bool.type_check
        result.ok?.should be_false
      end

    end

  end

end

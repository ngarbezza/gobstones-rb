describe Gobstones, "type checker" do

  describe "board expressions" do

    describe "puedeMover()" do

      it "should allow a direction as argument" do
        [Directions::Norte.new, Directions::Sur.new,
         Directions::Este.new, Directions::Oeste.new].each do |dir|
            puede_mover_dir = Functions::PuedeMover.new dir
            result = puede_mover_dir.type_check
            result.ok?.should be_true
          end
      end

      it "should not allow a number as argument" do
        pending
        puede_mover_number = Functions::PuedeMover.new 42
        result = puede_mover_number.type_check
        result.ok?.should be_false
      end

      it "should not allow a color as argument" do
        puede_mover_color = Functions::PuedeMover.new Colors::Verde.new
        result = puede_mover_color.type_check
        result.ok?.should be_false
      end

      it "should not allow a boolean as argument" do
        pending
        puede_mover_number = Functions::PuedeMover.new 42
        result = puede_mover_number.type_check
        result.ok?.should be_false
      end

    end


  end

end

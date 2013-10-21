describe Gobstones, "type checker" do

  describe "board expressions" do

    describe "puedeMover()" do

      it "should allow a direction as argument" do
        [Norte.new, Sur.new, Este.new, Oeste.new].each do |dir|
            puede_mover_dir = PuedeMover.new dir
            result = puede_mover_dir.type_check
            expect(result.ok?).to be_true
          end
      end

      it "should not allow a number as argument" do
        puede_mover_number = PuedeMover.new Number.new(42)
        result = puede_mover_number.type_check
        expect(result.ok?).to be_false
      end

      it "should not allow a color as argument" do
        puede_mover_color = PuedeMover.new Verde.new
        result = puede_mover_color.type_check
        expect(result.ok?).to be_false
      end

      it "should not allow a boolean as argument" do
        puede_mover_bool = PuedeMover.new True.new
        result = puede_mover_bool.type_check
        expect(result.ok?).to be_false
      end

    end

  end

end
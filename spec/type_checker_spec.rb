describe Gobstones, 'type checker' do

  describe 'board expressions' do

    describe 'puedeMover()' do

      it 'allows a direction as argument' do
        [norte, sur, este, oeste].each do |dir|
            puede_mover_dir = PuedeMover.new(dir)
            result = puede_mover_dir.type_check
            expect(result.ok?).to be(true)
          end
      end

      it 'does not allow a number as argument' do
        puede_mover_number = PuedeMover.new(42.to_gbs_num)
        result = puede_mover_number.type_check
        expect(result.ok?).to be(false)
      end

      it 'does not allow a color as argument' do
        puede_mover_color = PuedeMover.new(verde)
        result = puede_mover_color.type_check
        expect(result.ok?).to be(false)
      end

      it 'does not allow a boolean as argument' do
        puede_mover_bool = PuedeMover.new(true_value)
        result = puede_mover_bool.type_check
        expect(result.ok?).to be(false)
      end

    end
  end
end

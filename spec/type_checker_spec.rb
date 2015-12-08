describe Gobstones, 'type checker' do

  describe 'board expressions' do

    describe 'puedeMover()' do

      it 'allows a direction as argument' do
        [norte, sur, este, oeste].each do |dir|
          result = PuedeMover.new(dir).type_check

          expect(result.ok?).to be(true)
        end
      end

      it 'does not allow a number as argument' do
        result = PuedeMover.new(42.to_gbs_num).type_check

        expect(result.ok?).to be(false)
      end

      it 'does not allow a color as argument' do
        result = PuedeMover.new(verde).type_check

        expect(result.ok?).to be(false)
      end

      it 'does not allow a boolean as argument' do
        result = PuedeMover.new(true_value).type_check

        expect(result.ok?).to be(false)
      end

    end
  end
end

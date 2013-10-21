describe Head do

  it "should have a position, default 0;0" do
    head = Head.new

    expect(head.x_pos).to eq(0)
    expect(head.y_pos).to eq(0)
  end

  it "should answer the max size" do
    expect(Head::MAX_ROWS).to eq(9)
    expect(Head::MAX_COLS).to eq(9)
  end

  it "should allow to be created at a random position" do
    head = Head.at_random

    100.times { expect(head.x_pos.between?(0, Head::MAX_ROWS-1)).to be_true }
    100.times { expect(head.y_pos.between?(0, Head::MAX_COLS-1)).to be_true }
  end

  describe "movements" do

    let(:head)  { Head.new }
    let(:north) { Norte.new }
    let(:south) { Sur.new }
    let(:east)  { Este.new }
    let(:west)  { Oeste.new }

    context "valid" do

      it "should move north" do
        expect(head.can_move?(north)).to be_true
        expect { head.move(north) }.to_not raise_error
        expect(head.x_pos).to eq(0)
        expect(head.y_pos).to eq(1)
      end

      it "should move south" do
        head.move north
        expect(head.can_move?(south)).to be_true
        expect { head.move(south) }.to_not raise_error
        expect(head.x_pos).to eq(0)
        expect(head.y_pos).to eq(0)
      end

      it "should move east" do
        expect(head.can_move?(east)).to be_true
        expect { head.move(east) }.to_not raise_error
        expect(head.x_pos).to eq(1)
        expect(head.y_pos).to eq(0)
      end

      it "should move west" do
        head.move east
        expect(head.can_move?(west)).to be_true
        expect { head.move(west) }.to_not raise_error
        expect(head.x_pos).to eq(0)
        expect(head.y_pos).to eq(0)
      end

      it "should go to the origin" do
        head.move east
        head.move north
        head.go_to_origin
        expect(head.x_pos).to eq(0)
        expect(head.y_pos).to eq(0)
      end

    end

    context "non valid" do

      it "should fail moving north" do
        (Head::MAX_COLS-1).times { head.move north }

        expect(head.can_move?(north)).to be_false
        expect { head.move north }.to raise_error(OutOfBoardError)
      end

      it "should fail moving south" do
        expect(head.can_move?(south)).to be_false
        expect { head.move south }.to raise_error(OutOfBoardError)
      end

      it "should fail moving east" do
        (Head::MAX_ROWS-1).times { head.move east }

        expect(head.can_move?(east)).to be_false
        expect { head.move east }.to raise_error(OutOfBoardError)
      end

      it "should fail moving west" do
        expect(head.can_move?(west)).to be_false
        expect { head.move west }.to raise_error(OutOfBoardError)
      end

      it "should fail if the argument is not a direction" do
        expect { head.move Azul.new }.
          to raise_error(GobstonesTypeError, /is not a direction/)
        expect { head.move "not a direction" }.
          to raise_error(GobstonesTypeError, /is not a direction/)
        expect { head.move True.new }.
          to raise_error(GobstonesTypeError, /is not a direction/)
        expect { head.move 42 }.
          to raise_error(GobstonesTypeError, /is not a direction/)
      end

    end

  end

  describe "board actions" do

    let(:head) { Head.new }
    let(:black) { Negro.new }

    it "should put balls across the board" do
      3.times { head.put black }
      expect(head.are_there_balls?(black)).to be_true
      expect(head.number_of_balls(black)).to eq(3)
      head.move Norte.new
      2.times { head.put black }
      expect(head.number_of_balls(black)).to eq(2)
      head.move Este.new
      5.times { head.put black }
      expect(head.number_of_balls(black)).to eq(5)
    end

    it "should take out balls across the board" do
      4.times { head.put black }
      4.times { head.take_out black }

      expect(head.are_there_balls?(black)).to be_false
    end

  end

end

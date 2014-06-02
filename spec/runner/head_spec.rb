describe Head do

  let(:head)  { Head.new }

  it "should have a position, default 0;0" do
    expect(head.x_pos).to eq(0)
    expect(head.y_pos).to eq(0)
  end

  it "should answer the max size" do
    expect(Head::MAX_ROWS).to eq(9)
    expect(Head::MAX_COLS).to eq(9)
  end

  it "should allow to be created at a random position" do
    head = Head.at_random

    100.times { expect(head.x_pos.between?(0, Head::MAX_ROWS-1)).to be true }
    100.times { expect(head.y_pos.between?(0, Head::MAX_COLS-1)).to be true }
  end

  describe "movements" do

    context "valid" do

      it "should move north" do
        expect(head.can_move?(norte)).to be true
        expect { head.move(norte) }.to_not raise_error
        expect(head.x_pos).to eq(0)
        expect(head.y_pos).to eq(1)
      end

      it "should move south" do
        head.move norte
        expect(head.can_move?(sur)).to be true
        expect { head.move(sur) }.to_not raise_error
        expect(head.x_pos).to eq(0)
        expect(head.y_pos).to eq(0)
      end

      it "should move east" do
        expect(head.can_move?(este)).to be true
        expect { head.move(este) }.to_not raise_error
        expect(head.x_pos).to eq(1)
        expect(head.y_pos).to eq(0)
      end

      it "should move west" do
        head.move este
        expect(head.can_move?(oeste)).to be true
        expect { head.move(oeste) }.to_not raise_error
        expect(head.x_pos).to eq(0)
        expect(head.y_pos).to eq(0)
      end

      it "should go to the origin" do
        head.move este
        head.move norte
        head.go_to_origin
        expect(head.x_pos).to eq(0)
        expect(head.y_pos).to eq(0)
      end

    end

    context "non valid" do

      it "should fail moving north" do
        (Head::MAX_COLS-1).times { head.move norte }

        expect(head.can_move?(norte)).to be false
        expect { head.move norte }.to raise_error(OutOfBoardError)
      end

      it "should fail moving south" do
        expect(head.can_move?(sur)).to be false
        expect { head.move sur }.to raise_error(OutOfBoardError)
      end

      it "should fail moving east" do
        (Head::MAX_ROWS-1).times { head.move este }

        expect(head.can_move?(este)).to be false
        expect { head.move este }.to raise_error(OutOfBoardError)
      end

      it "should fail moving west" do
        expect(head.can_move?(oeste)).to be false
        expect { head.move oeste }.to raise_error(OutOfBoardError)
      end

      it "should fail if the argument is not a direction" do
        expect { head.move azul }.
          to raise_error(GobstonesTypeError, /is not a direction/)
        expect { head.move "not a direction" }.
          to raise_error(GobstonesTypeError, /is not a direction/)
        expect { head.move true_value }.
          to raise_error(GobstonesTypeError, /is not a direction/)
        expect { head.move 42 }.
          to raise_error(GobstonesTypeError, /is not a direction/)
      end

    end

  end

  describe "board actions" do

    it "should put balls across the board" do
      3.times { head.put negro }
      expect(head.are_there_balls?(negro)).to be true
      expect(head.number_of_balls(negro)).to eq(3)
      head.move norte
      2.times { head.put negro }
      expect(head.number_of_balls(negro)).to eq(2)
      head.move este
      5.times { head.put negro }
      expect(head.number_of_balls(negro)).to eq(5)
    end

    it "should take out balls across the board" do
      4.times { head.put negro }
      4.times { head.take_out negro }

      expect(head.are_there_balls?(negro)).to be false
    end

  end

end

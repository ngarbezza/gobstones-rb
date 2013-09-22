describe Head do

  it "should have a position, default 0;0" do
    head = Head.new

    head.x_pos.should == 0
    head.y_pos.should == 0
  end

  it "should answer the max size" do
    Head::MAX_ROWS.should == 9
    Head::MAX_COLS.should == 9
  end

  it "should allow to be created at a random position" do
    head = Head.at_random

    100.times { head.x_pos.between?(0, Head::MAX_ROWS-1).should be_true }
    100.times { head.y_pos.between?(0, Head::MAX_COLS-1).should be_true }
  end

  describe "movements" do

    let(:head)  { Head.new }
    let(:north) { Norte.new }
    let(:south) { Sur.new }
    let(:east)  { Este.new }
    let(:west)  { Oeste.new }

    context "valid" do

      it "should move north" do
        head.can_move?(north).should be_true
        expect { head.move(north) }.to_not raise_error
        head.x_pos.should == 0
        head.y_pos.should == 1
      end

      it "should move south" do
        head.move north
        head.can_move?(south).should be_true
        expect { head.move(south) }.to_not raise_error
        head.x_pos.should == 0
        head.y_pos.should == 0
      end

      it "should move east" do
        head.can_move?(east).should be_true
        expect { head.move(east) }.to_not raise_error
        head.x_pos.should == 1
        head.y_pos.should == 0
      end

      it "should move west" do
        head.move east
        head.can_move?(west).should be_true
        expect { head.move(west) }.to_not raise_error
        head.x_pos.should == 0
        head.y_pos.should == 0
      end

    end

    context "non valid" do

      it "should fail moving north" do
        (Head::MAX_COLS-1).times { head.move north }

        head.can_move?(north).should be_false
        expect { head.move north }.to raise_error(OutOfBoardError)
      end

      it "should fail moving south" do
        head.can_move?(south).should be_false
        expect { head.move south }.to raise_error(OutOfBoardError)
      end

      it "should fail moving east" do
        (Head::MAX_ROWS-1).times { head.move east }

        head.can_move?(east).should be_false
        expect { head.move east }.to raise_error(OutOfBoardError)
      end

      it "should fail moving west" do
        head.can_move?(west).should be_false
        expect { head.move west }.to raise_error(OutOfBoardError)
      end

      it "should fail if the argument is not a direction" do
        expect { head.move Azul.new }.
          to raise_error(GbsTypeError, /is not a direction/)
        expect { head.move "not a direction" }.
          to raise_error(GbsTypeError, /is not a direction/)
        expect { head.move True.new }.
          to raise_error(GbsTypeError, /is not a direction/)
        expect { head.move 42 }.
          to raise_error(GbsTypeError, /is not a direction/)
      end

    end

  end

  describe "board actions" do

    let(:head) { Head.new }
    let(:black) { Negro.new }

    it "should put balls across the board" do
      3.times { head.put black }
      head.are_there_balls?(black).should be_true
      head.number_of_balls(black).should == 3
      head.move Norte.new
      2.times { head.put black }
      head.number_of_balls(black).should == 2
      head.move Este.new
      5.times { head.put black }
      head.number_of_balls(black).should == 5
    end

    it "should take out balls across the board" do
      4.times { head.put black }
      4.times { head.take_out black }

      head.are_there_balls?(black).should be_false
    end

  end

end

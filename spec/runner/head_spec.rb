# frozen_string_literal: true

RSpec.describe Head do
  subject(:head) { described_class.new }

  it 'has a position, default 0;0' do
    expect(head.x_pos).to eq(0)
    expect(head.y_pos).to eq(0)
  end

  it 'answers the max size' do
    expect(described_class::MAX_ROWS).to eq(9)
    expect(described_class::MAX_COLS).to eq(9)
  end

  it 'allows to be created at a random position' do
    head = described_class.at_random

    expect(head.x_pos.between?(0, described_class::MAX_ROWS - 1)).to be(true)
    expect(head.y_pos.between?(0, described_class::MAX_COLS - 1)).to be(true)
  end

  describe 'movements' do
    context 'when is a valid movement' do
      it 'moves north' do
        expect(head.can_move?(norte)).to be(true)
        expect { head.move(norte) }.not_to raise_error
        expect(head.x_pos).to eq(0)
        expect(head.y_pos).to eq(1)
      end

      it 'moves south' do
        head.move norte

        expect(head.can_move?(sur)).to be(true)
        expect { head.move(sur) }.not_to raise_error
        expect(head.x_pos).to eq(0)
        expect(head.y_pos).to eq(0)
      end

      it 'moves east' do
        expect(head.can_move?(este)).to be(true)
        expect { head.move(este) }.not_to raise_error
        expect(head.x_pos).to eq(1)
        expect(head.y_pos).to eq(0)
      end

      it 'moves west' do
        head.move este

        expect(head.can_move?(oeste)).to be(true)
        expect { head.move(oeste) }.not_to raise_error
        expect(head.x_pos).to eq(0)
        expect(head.y_pos).to eq(0)
      end

      it 'goes to the origin' do
        head.move este
        head.move norte
        head.go_to_origin

        expect(head.x_pos).to eq(0)
        expect(head.y_pos).to eq(0)
      end
    end

    context 'when it is not a valid movement' do
      it 'fails moving north' do
        (Head::MAX_COLS - 1).times { head.move norte }

        expect(head.can_move?(norte)).to be(false)
        expect { head.move norte }.to raise_error(OutOfBoardError)
      end

      it 'fails moving south' do
        expect(head.can_move?(sur)).to be(false)
        expect { head.move sur }.to raise_error(OutOfBoardError)
      end

      it 'fails moving east' do
        (described_class::MAX_ROWS - 1).times { head.move este }

        expect(head.can_move?(este)).to be(false)
        expect { head.move este }.to raise_error(OutOfBoardError)
      end

      it 'fails moving west' do
        expect(head.can_move?(oeste)).to be(false)
        expect { head.move oeste }.to raise_error(OutOfBoardError)
      end

      it 'fails if the argument is not a direction' do
        expect { head.move azul }.to raise_error(GobstonesTypeError, /is not a direction/)
        expect { head.move 'not a direction' }.to raise_error(GobstonesTypeError, /is not a direction/)
        expect { head.move true_value }.to raise_error(GobstonesTypeError, /is not a direction/)
        expect { head.move 42 }.to raise_error(GobstonesTypeError, /is not a direction/)
      end
    end
  end

  describe 'board actions' do
    it 'puts balls across the board' do
      3.times { head.put negro }

      expect(head.are_there_balls?(negro)).to be(true)
      expect(head.number_of_balls(negro)).to eq(3)

      head.move norte
      2.times { head.put negro }

      expect(head.number_of_balls(negro)).to eq(2)

      head.move este
      5.times { head.put negro }

      expect(head.number_of_balls(negro)).to eq(5)
    end

    it 'takes out balls across the board' do
      4.times { head.put negro }
      4.times { head.take_out negro }

      expect(head.are_there_balls?(negro)).to be(false)
    end
  end
end

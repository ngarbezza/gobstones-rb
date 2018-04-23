module BoardAssertions
  def expect_balls(*colors, on: context.head)
    colors.each do |color|
      expect(on.are_there_balls?(color)).to be(true)
    end
  end

  def expect_no_balls(*colors, on: context.head)
    colors.each do |color|
      expect(on.are_there_balls?(color)).to be(false)
    end
  end

  def expect_positioned_at(x_pos, y_pos)
    expect(context.head.x_pos).to eq(x_pos)
    expect(context.head.y_pos).to eq(y_pos)
  end
end

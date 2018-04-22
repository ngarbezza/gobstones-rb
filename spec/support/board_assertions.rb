module BoardAssertions
  def expect_balls(*colors)
    colors.each do |color|
      expect(context.head.are_there_balls?(color)).to be(true)
    end
  end

  def expect_no_balls(*colors)
    colors.each do |color|
      expect(context.head.are_there_balls?(color)).to be(false)
    end
  end
end

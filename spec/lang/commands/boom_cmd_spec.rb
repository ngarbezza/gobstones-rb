describe Boom do

  it "should raise an exception when evaluating, with the right message" do
    msg = 'This is a program error'
    expect { Boom.new(msg).evaluate }.to raise_error(BoomError, msg)
  end

end
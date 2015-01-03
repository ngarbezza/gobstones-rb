describe Boom do

  it "raises an error when evaluating, with the message specified" do
    msg = 'This is a program error'
    expect { Boom.new(msg).evaluate(clean_context) }.to raise_error(BoomError, msg)
  end

end

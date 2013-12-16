describe Boom do

  let(:context) { NullExecutionContext.new }

  it "raises an error when evaluating, with the message specified" do
    msg = 'This is a program error'
    expect { Boom.new(msg).evaluate(context) }.to raise_error(BoomError, msg)
  end

end

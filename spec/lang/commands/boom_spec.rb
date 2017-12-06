describe Boom do
  it 'raises an error when evaluating, with the message specified' do
    message = 'This is a program error'

    expect { Boom.new(message).evaluate(clean_context) }.to raise_error(BoomError, message)
  end
end
